import 'package:hotelifoz/core/extensions/int_ext.dart';

class HotelEntity {
  final String id;
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
    required this.id,
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

  factory HotelEntity.fromMap(Map<String, dynamic> map) {
    return HotelEntity(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      price: map['price']?.toInt() ?? 0,
      rating: map['rating']?.toDouble() ?? 0.0,
      totalReviews: map['totalReviews']?.toInt() ?? 0,
      imageUrl: map['imageUrl'] ?? '',
      facilities: List<String>.from(map['facilities']),
      features: List<String>.from(map['features']),
      images: List<String>.from(map['images']),
    );
  }
}
