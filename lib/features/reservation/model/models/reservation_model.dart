import 'package:hotelifoz/features/home/model/models/hotel_model.dart';
import 'package:hotelifoz/features/reservation/model/models/payment_model.dart';

class ReservationModel {
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
  final DateTime? createdAt;

  ReservationModel({
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
    this.createdAt,
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
      'createdAt': DateTime.now(),
    };
  }

  @override
  String toString() {
    return 'ReservationModel(id: $id, hotel: $hotel, checkIn: $checkIn, checkOut: $checkOut, duration: $duration, guest: $guest, customerStatus: $customerStatus, customerName: $customerName, customerPhone: $customerPhone, customerEmail: $customerEmail, paymentMethod: $paymentMethod, price: $price, createdAt: $createdAt)';
  }

  factory ReservationModel.fromMap(Map<String, dynamic> map) {
    return ReservationModel(
      id: map['id'] ?? '',
      hotel: HotelModel.fromMap(map['hotel']),
      checkIn: map['checkIn'] ?? '',
      checkOut: map['checkOut'] ?? '',
      duration: map['duration']?.toInt() ?? 0,
      guest: map['guest']?.toInt() ?? 0,
      customerStatus: map['customerStatus'] ?? '',
      customerName: map['customerName'] ?? '',
      customerPhone: map['customerPhone'] ?? '',
      customerEmail: map['customerEmail'] ?? '',
      paymentMethod: PaymentModel.fromMap(map['paymentMethod']),
      price: map['price']?.toInt() ?? 0,
      createdAt: DateTime.fromMillisecondsSinceEpoch(
          map['createdAt'].millisecondsSinceEpoch),
    );
  }
}
