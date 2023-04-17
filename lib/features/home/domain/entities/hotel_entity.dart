import 'package:hotelifoz/core/extensions/int_ext.dart';

class HotelEntity {
  final String name;
  final String address;
  final int price;
  final double rating;
  final int totalReviews;
  final String imageUrl;
  final List<String> facilities;
  final List<String> features;
  final List<String> images;

  HotelEntity({
    required this.name,
    required this.address,
    required this.price,
    required this.rating,
    required this.totalReviews,
    required this.imageUrl,
    required this.facilities,
    required this.features,
    required this.images,
  });

  String get currencyFormat => price.currencyFormatIDR;
  String get totalReviewsFormat => totalReviews.numberFormat;
}
