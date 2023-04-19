import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hotelifoz/core/sessions/session.dart';
import 'package:hotelifoz/features/bookmark/model/models/bookmark_query.dart';
import 'package:hotelifoz/features/home/model/models/hotel_model.dart';

abstract class BookmarkLocalService {
  List _bookmarks = mainStorage.get("bookmarks") ?? [];

  void saveToLocalStorage() async {
    await mainStorage.put("bookmarks", _bookmarks);
  }

  bool isBookmark(HotelModel hotel) {
    if (_bookmarks.indexWhere((element) => element["id"] == hotel.id) == -1) {
      return false;
    } else {
      return true;
    }
  }

  Future<Either<String, List<HotelModel>>> getBookmarks();

  Future<Either<String, HotelModel>> saveBookmark(HotelModel hotel);
}

class BookmarkLocalServiceImpl extends BookmarkLocalService {
  @override
  Future<Either<String, List<HotelModel>>> getBookmarks() async {
    try {
      List<Map<String, dynamic>> result = [];

      for (Map data in _bookmarks) {
        final String stringData = jsonEncode(data);
        result.add(jsonDecode(stringData));
      }
      _bookmarks = result;

      return Right(_bookmarks.map((e) => HotelModel.fromMap(e)).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, HotelModel>> saveBookmark(HotelModel hotel) async {
    try {
      if (!isBookmark(hotel)) {
        _bookmarks.add(BookmarkQuery(
          id: hotel.id,
          name: hotel.name,
          address: hotel.address,
          price: hotel.price,
          rating: hotel.rating,
          totalReviews: hotel.totalReviews,
          imageUrl: hotel.imageUrl,
          facilities: hotel.facilities,
          features: hotel.features,
          images: hotel.images,
        ).toMap());
      } else {
        _bookmarks.removeWhere((element) => element["id"] == hotel.id);
      }
      saveToLocalStorage();
      return Right(hotel);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
