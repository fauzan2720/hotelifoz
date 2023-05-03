import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotelifoz/features/home/model/models/hotel_model.dart';
import 'package:hotelifoz/features/home/model/repositories/hotel_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'hotel_repository_test.mocks.dart';

@GenerateMocks([HotelRepositoryImpl])
void main() {
  group('hotel repository ...', () {
    final HotelRepositoryImpl hotelRepositoryImpl = MockHotelRepositoryImpl();

    final List<HotelModel> hotels = [
      HotelModel(
        id: 'hotel123',
        name: 'Hotel Seribu Bintang',
        address: 'Jalan Raya Anywhere No. 123, Jakarta',
        price: 1000000,
        rating: 4.5,
        totalReviews: 50,
        imageUrl: 'https://example.com/hotel123.jpg',
        facilities: ['Free WiFi', 'Swimming pool', 'Spa'],
        features: ['24-hour front desk', 'Airport shuttle', 'Free parking'],
        images: [
          'https://example.com/hotel123_1.jpg',
          'https://example.com/hotel123_2.jpg',
          'https://example.com/hotel123_3.jpg'
        ],
      ),
    ];

    test('get all hotels success', () async {
      when(hotelRepositoryImpl.getHotels())
          .thenAnswer((realInvocation) async => Right(hotels));

      final response = await hotelRepositoryImpl.getHotels();
      response.fold(
        (failed) => null,
        (result) => expect(result, hotels),
      );
    });
  });
}
