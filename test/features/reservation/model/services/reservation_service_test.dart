import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotelifoz/features/home/model/models/hotel_model.dart';
import 'package:hotelifoz/features/launch/model/models/user_model.dart';
import 'package:hotelifoz/features/reservation/model/models/payment_model.dart';
import 'package:hotelifoz/features/reservation/model/models/reservation_model.dart';
import 'package:hotelifoz/features/reservation/model/services/reservation_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'reservation_service_test.mocks.dart';

@GenerateMocks([ReservationService])
void main() {
  group('reservation service ...', () {
    final ReservationService reservationService = MockReservationService();

    final ReservationModel reservationModel = ReservationModel(
      id: '1',
      user: UserModel(
        id: '123',
        name: 'John Doe',
        email: 'johndoe@example.com',
        phoneNumber: '+1 123-456-7890',
        photo: 'https://via.placeholder.com/150',
        createdAt: DateTime(2022, 5, 3),
        updatedAt: DateTime(2022, 5, 3),
      ),
      hotel: HotelModel(
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
      checkIn: '2022-05-10',
      checkOut: '2022-05-15',
      duration: 5,
      guest: 2,
      customerStatus: 'Active',
      customerName: 'Jane Doe',
      customerPhone: '+1 234-567-8901',
      customerEmail: 'janedoe@example.com',
      paymentMethod: PaymentModel(
        index: 3,
        name: 'DANA',
        iconUrl: "iconUrl",
      ),
      price: 1000,
      createdAt: DateTime(2022, 5, 3),
    );

    final List<ReservationModel> reservations = [reservationModel];

    test('get all reservation success', () async {
      when(reservationService.getReservation("1"))
          .thenAnswer((realInvocation) => Stream.value(Right(reservations)));

      final response = await reservationService.getReservation("1").first;
      response.fold(
        (failed) => null,
        (result) => expect(result, reservations),
      );
    });

    test('booking hotel success', () async {
      when(reservationService.checkout(reservationModel))
          .thenAnswer((realInvocation) async => true);

      final bool result = await reservationService.checkout(reservationModel);
      expect(result, true);
    });
  });
}
