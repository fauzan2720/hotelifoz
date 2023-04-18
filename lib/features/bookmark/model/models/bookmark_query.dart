class BookmarkQuery {
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

  BookmarkQuery({
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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'price': price,
      'rating': rating,
      'totalReviews': totalReviews,
      'imageUrl': imageUrl,
      'facilities': facilities,
      'features': features,
      'images': images,
    };
  }
}
