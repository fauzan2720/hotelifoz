import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hotelifoz/core/sessions/session.dart';
import 'package:hotelifoz/features/bookmark/model/models/bookmark_query.dart';
import 'package:hotelifoz/features/home/domain/entities/hotel_entity.dart';

class BookmarkLocalService {
  List _bookmarks = mainStorage.get("bookmarks") ?? [];

  void saveToLocalStorage() async {
    await mainStorage.put("bookmarks", _bookmarks);
  }

  isBookmark(HotelEntity hotel) {
    if (_bookmarks.indexWhere((element) => element["id"] == hotel.id) == -1) {
      return false;
    } else {
      return true;
    }
  }

  Future<Either<String, List<HotelEntity>>> getBookmarks() async {
    try {
      List<Map<String, dynamic>> result = [];

      for (Map data in _bookmarks) {
        final String stringData = jsonEncode(data);
        result.add(jsonDecode(stringData));
      }
      _bookmarks = result;

      return Right(_bookmarks.map((e) => HotelEntity.fromMap(e)).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, HotelEntity>> saveBookmark(HotelEntity hotel) async {
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
