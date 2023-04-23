import 'package:hotelifoz/features/home/model/models/hotel_model.dart';

class CheckoutQuery {
  final HotelModel hotel;
  final String checkIn;
  final String checkOut;
  final int duration;
  final int guest;
  final String customerStatus;
  final String customerName;
  final String customerPhone;
  final String customerEmail;
  final String paymentMethod;

  CheckoutQuery({
    required this.hotel,
    required this.checkIn,
    required this.checkOut,
    required this.duration,
    required this.guest,
    required this.customerStatus,
    required this.customerName,
    required this.customerPhone,
    required this.customerEmail,
    required this.paymentMethod,
  });

  @override
  String toString() {
    return 'CheckoutQuery(hotel: ${hotel.name}, checkIn: $checkIn, checkOut: $checkOut, duration: $duration, guest: $guest, customerStatus: $customerStatus, customerName: $customerName, customerPhone: $customerPhone, customerEmail: $customerEmail, paymentMethod: $paymentMethod)';
  }
}
