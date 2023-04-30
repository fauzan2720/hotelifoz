import 'package:hotelifoz/features/home/model/models/hotel_model.dart';
import 'package:hotelifoz/features/launch/model/models/user_model.dart';
import 'package:hotelifoz/features/reservation/model/models/payment_model.dart';

class ReservationModel {
  final String id;
  final UserModel user;
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
    required this.user,
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

  int get taxesAndFees => (price * (10 / 100)).toInt();
  int get totalPayment => price + taxesAndFees;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user': user.toMap(),
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
      'taxesAndFees': taxesAndFees,
      'totalPayment': totalPayment,
    };
  }

  @override
  String toString() {
    return 'ReservationModel(id: $id, user: $user, hotel: $hotel, checkIn: $checkIn, checkOut: $checkOut, duration: $duration, guest: $guest, customerStatus: $customerStatus, customerName: $customerName, customerPhone: $customerPhone, customerEmail: $customerEmail, paymentMethod: $paymentMethod, price: $price, taxesAndFees: $taxesAndFees, totalPayment: $totalPayment, createdAt: $createdAt)';
  }

  factory ReservationModel.fromMap(Map<String, dynamic> map) {
    return ReservationModel(
      id: map['id'] ?? '',
      user: UserModel.fromMap(map['user']),
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
