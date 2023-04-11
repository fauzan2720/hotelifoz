import 'package:hotelifoz/core/extensions/int_ext.dart';

class HotelEntity {
  final String name;
  final String address;
  final int price;
  final double rating;
  final int totalReviews;
  final String imageUrl;

  HotelEntity({
    required this.name,
    required this.address,
    required this.price,
    required this.rating,
    required this.totalReviews,
    required this.imageUrl,
  });

  String get currencyFormat => price.currencyFormatIDR;
  String get totalReviewsFormat => price.numberFormat;
}
