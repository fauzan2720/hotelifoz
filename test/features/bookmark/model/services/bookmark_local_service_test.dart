import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotelifoz/features/bookmark/model/services/bookmark_local_service.dart';
import 'package:hotelifoz/features/home/model/models/hotel_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'bookmark_local_service_test.mocks.dart';

@GenerateMocks([BookmarkLocalServiceImpl])
void main() {
  group('bookmark local service ...', () {
    final BookmarkLocalServiceImpl bookmarkLocalServiceImpl =
        MockBookmarkLocalServiceImpl();

    final HotelModel query = HotelModel(
      id: "id",
      name: "name",
      address: "address",
      price: 0,
      rating: 0,
      totalReviews: 0,
      imageUrl: "imageUrl",
      facilities: ["facility1", "facility2"],
      features: ["feature1", "feature2"],
      images: ["image1", "image2"],
    );

    final List<HotelModel> contacts = [query];

    test('get all contacts success', () {
      when(bookmarkLocalServiceImpl.getBookmarks())
          .thenAnswer((realInvocation) async => Right(contacts));
    });

    test('create contact success', () {
      when(bookmarkLocalServiceImpl.saveBookmark(query))
          .thenAnswer((realInvocation) async => Right(HotelModel(
                id: query.id,
                name: query.name,
                address: query.address,
                price: query.price,
                rating: query.rating,
                totalReviews: query.totalReviews,
                imageUrl: query.imageUrl,
                facilities: query.facilities,
                features: query.features,
                images: query.images,
              )));
    });

    test('check contact success', () {
      when(bookmarkLocalServiceImpl.isBookmark(query))
          .thenAnswer((realInvocation) => true);
    });
  });
}
