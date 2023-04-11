import 'package:hotelifoz/features/home/domain/entities/hotel_entity.dart';

class HotelResponseModel {
  String? id;
  String? name;
  String? address;
  String? postalCode;
  Country? country;
  Country? region;
  Country? city;
  Country? area;
  Location? location;
  Reviews? reviews;
  MainImage? mainImage;
  List<MainFacilities>? mainFacilities;
  int? availableRoom;
  RateInfo? rateInfo;
  bool? soldOut;
  bool? isNewHotel;
  List<BenefitAdded>? benefitAdded;
  List<ListAdded>? listAdded;

  HotelResponseModel({
    this.id,
    this.name,
    this.address,
    this.postalCode,
    this.country,
    this.region,
    this.city,
    this.area,
    this.location,
    this.reviews,
    this.mainImage,
    this.mainFacilities,
    this.availableRoom,
    this.rateInfo,
    this.soldOut,
    this.isNewHotel,
    this.benefitAdded,
    this.listAdded,
  });

  HotelEntity toEntity() {
    return HotelEntity(
      name: name ?? '',
      address: address ?? '',
      price: rateInfo?.priceSummary?.total ?? 0,
      rating: reviews?.score ?? 0.0,
      totalReviews: reviews?.tiket?.count ?? 0,
      imageUrl: mainImage?.url ?? "https://i.ibb.co/S32HNjD/no-image.jpg",
    );
  }

  HotelResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    postalCode = json['postalCode'];
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    region = json['region'] != null ? Country.fromJson(json['region']) : null;
    city = json['city'] != null ? Country.fromJson(json['city']) : null;
    area = json['area'] != null ? Country.fromJson(json['area']) : null;
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    reviews =
        json['reviews'] != null ? Reviews.fromJson(json['reviews']) : null;
    mainImage = json['mainImage'] != null
        ? MainImage.fromJson(json['mainImage'])
        : null;
    if (json['mainFacilities'] != null) {
      mainFacilities = <MainFacilities>[];
      json['mainFacilities'].forEach((v) {
        mainFacilities!.add(MainFacilities.fromJson(v));
      });
    }
    availableRoom = json['availableRoom'];
    rateInfo =
        json['rateInfo'] != null ? RateInfo.fromJson(json['rateInfo']) : null;
    soldOut = json['soldOut'];
    isNewHotel = json['isNewHotel'];
    if (json['benefitAdded'] != null) {
      benefitAdded = <BenefitAdded>[];
      json['benefitAdded'].forEach((v) {
        benefitAdded!.add(BenefitAdded.fromJson(v));
      });
    }
    if (json['listAdded'] != null) {
      listAdded = <ListAdded>[];
      json['listAdded'].forEach((v) {
        listAdded!.add(ListAdded.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['postalCode'] = postalCode;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    if (region != null) {
      data['region'] = region!.toJson();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    if (area != null) {
      data['area'] = area!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.toJson();
    }
    if (mainImage != null) {
      data['mainImage'] = mainImage!.toJson();
    }
    if (mainFacilities != null) {
      data['mainFacilities'] = mainFacilities!.map((v) => v.toJson()).toList();
    }
    data['availableRoom'] = availableRoom;
    if (rateInfo != null) {
      data['rateInfo'] = rateInfo!.toJson();
    }
    data['soldOut'] = soldOut;
    data['isNewHotel'] = isNewHotel;
    if (benefitAdded != null) {
      data['benefitAdded'] = benefitAdded!.map((v) => v.toJson()).toList();
    }
    if (listAdded != null) {
      data['listAdded'] = listAdded!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Country {
  String? id;
  String? name;

  Country({this.id, this.name});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Location {
  Coordinates? coordinates;

  Location({this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'] != null
        ? Coordinates.fromJson(json['coordinates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coordinates != null) {
      data['coordinates'] = coordinates!.toJson();
    }
    return data;
  }
}

class Coordinates {
  double? latitude;
  double? longitude;

  Coordinates({this.latitude, this.longitude});

  Coordinates.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class Reviews {
  double? score;
  Tiket? tiket;

  Reviews({this.score, this.tiket});

  Reviews.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    tiket = json['tiket'] != null ? Tiket.fromJson(json['tiket']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['score'] = score;
    if (tiket != null) {
      data['tiket'] = tiket!.toJson();
    }
    return data;
  }
}

class Tiket {
  int? count;
  String? impression;
  double? rating;

  Tiket({this.count, this.impression, this.rating});

  Tiket.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    impression = json['impression'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['impression'] = impression;
    data['rating'] = rating;
    return data;
  }
}

class MainImage {
  String? caption;
  String? url;
  String? mobileUrl;

  MainImage({this.caption, this.url, this.mobileUrl});

  MainImage.fromJson(Map<String, dynamic> json) {
    caption = json['caption'];
    url = json['url'];
    mobileUrl = json['mobileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['caption'] = caption;
    data['url'] = url;
    data['mobileUrl'] = mobileUrl;
    return data;
  }
}

class MainFacilities {
  String? name;
  String? icon;

  MainFacilities({this.name, this.icon});

  MainFacilities.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['icon'] = icon;
    return data;
  }
}

class RateInfo {
  String? currency;
  PriceSummary? priceSummary;

  RateInfo({this.currency, this.priceSummary});

  RateInfo.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    priceSummary = json['priceSummary'] != null
        ? PriceSummary.fromJson(json['priceSummary'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currency'] = currency;
    if (priceSummary != null) {
      data['priceSummary'] = priceSummary!.toJson();
    }
    return data;
  }
}

class PriceSummary {
  int? total;

  PriceSummary({this.total});

  PriceSummary.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    return data;
  }
}

class BenefitAdded {
  String? id;
  String? name;
  String? iconUrl;

  BenefitAdded({this.id, this.name, this.iconUrl});

  BenefitAdded.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iconUrl = json['iconUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['iconUrl'] = iconUrl;
    return data;
  }
}

class ListAdded {
  String? id;
  String? name;
  String? iconUrl;
  String? subName;

  ListAdded({this.id, this.name, this.iconUrl, this.subName});

  ListAdded.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iconUrl = json['iconUrl'];
    subName = json['subName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['iconUrl'] = iconUrl;
    data['subName'] = subName;
    return data;
  }
}
