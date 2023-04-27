import 'package:hotelifoz/features/home/model/models/hotel_model.dart';
import 'package:hotelifoz/features/reservation/model/models/payment_model.dart';

class CheckoutQuery {
  final String id;
  final HotelModel hotel;
  final String checkIn;
  final String checkOut;
  final int duration;
  final int guest;
  final String customerStatus;
  final String customerName;
  final String customerPhone;
  final String customerEmail;
  final PaymentModel paymentMethod;
  final int price;

  CheckoutQuery({
    required this.id,
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
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'hotel': hotel.toMap(),
      'checkIn': checkIn,
      'checkOut': checkOut,
      'duration': duration,
      'guest': guest,
      'customerStatus': customerStatus,
      'customerName': customerName,
      'customerPhone': customerPhone,
      'customerEmail': customerEmail,
      'paymentMethod': paymentMethod.toMap(),
      'price': price,
      'created_at': DateTime.now().toString(),
      'updated_at': DateTime.now().toString(),
    };
  }

  @override
  String toString() {
    return 'CheckoutQuery(id: $id, hotel: $hotel, checkIn: $checkIn, checkOut: $checkOut, duration: $duration, guest: $guest, customerStatus: $customerStatus, customerName: $customerName, customerPhone: $customerPhone, customerEmail: $customerEmail, paymentMethod: $paymentMethod, price: $price)';
  }
}
