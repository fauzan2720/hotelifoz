import 'package:hotelifoz/features/home/model/models/hotel_model.dart';

class HotelResponseModel {
  String? id;
  String? name;
  String? displayName;
  String? region;
  String? starRating;
  String? userRating;
  String? numReviews;
  String? userRatingInfo;
  String? latitude;
  String? longitude;
  String? lowRate;
  List<String>? showedFacilityTypes;
  List<HotelFeatures>? hotelFeatures;
  String? imageUrl;
  List<String>? imageUrls;
  String? hotelSeoUrl;

  HotelResponseModel({
    this.id,
    this.name,
    this.displayName,
    this.region,
    this.starRating,
    this.userRating,
    this.numReviews,
    this.userRatingInfo,
    this.latitude,
    this.longitude,
    this.lowRate,
    this.showedFacilityTypes,
    this.hotelFeatures,
    this.imageUrl,
    this.imageUrls,
    this.hotelSeoUrl,
  });

  HotelModel toEntity() {
    return HotelModel(
      id: id ?? '',
      name: name ?? '',
      address: region ?? '',
      price: int.parse(lowRate ?? "0"),
      rating: double.parse(starRating ?? "0.0"),
      totalReviews: int.parse(numReviews ?? "0"),
      imageUrl: imageUrl ?? "https://i.ibb.co/S32HNjD/no-image.jpg",
      facilities: showedFacilityTypes ?? [],
      features: (hotelFeatures ?? []).map((e) => e.text ?? '').toList(),
      images: imageUrls ?? [],
    );
  }

  HotelResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displayName = json['displayName'];
    region = json['region'];
    starRating = json['starRating'];
    userRating = json['userRating'];
    numReviews = json['numReviews'];
    userRatingInfo = json['userRatingInfo'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    lowRate = json['lowRate'];
    if (json['showedFacilityTypes'] != null) {
      showedFacilityTypes = [];
      json['showedFacilityTypes'].forEach((v) {
        showedFacilityTypes!.add(v);
      });
    }
    if (json['hotelFeatures'] != null) {
      hotelFeatures = <HotelFeatures>[];
      json['hotelFeatures'].forEach((v) {
        hotelFeatures!.add(HotelFeatures.fromJson(v));
      });
    }
    imageUrl = json['imageUrl'];
    if (json['imageUrls'] != null) {
      imageUrls = [];
      json['imageUrls'].forEach((v) {
        imageUrls!.add(v);
      });
    }
    hotelSeoUrl = json['hotelSeoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['displayName'] = displayName;
    data['region'] = region;
    data['starRating'] = starRating;
    data['userRating'] = userRating;
    data['numReviews'] = numReviews;
    data['userRatingInfo'] = userRatingInfo;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['lowRate'] = lowRate;
    data['showedFacilityTypes'] = showedFacilityTypes;
    if (hotelFeatures != null) {
      data['hotelFeatures'] = hotelFeatures!.map((v) => v.toJson()).toList();
    }
    data['imageUrl'] = imageUrl;
    data['imageUrls'] = imageUrls;
    data['hotelSeoUrl'] = hotelSeoUrl;
    return data;
  }
}

class HotelFeatures {
  String? text;
  String? backgroundColor;
  String? textColor;
  String? icon;
  String? type;

  HotelFeatures({
    this.text,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.type,
  });

  HotelFeatures.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    backgroundColor = json['backgroundColor'];
    textColor = json['textColor'];
    icon = json['icon'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['backgroundColor'] = backgroundColor;
    data['textColor'] = textColor;
    data['icon'] = icon;
    data['type'] = type;
    return data;
  }
}
