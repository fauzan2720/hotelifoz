import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hotelifoz/features/home/data/models/hotel_response_model.dart';

abstract class HotelLocalDatasource {
  Future<List<HotelResponseModel>> getHotels();
}

class HotelLocalDatasourceImpl implements HotelLocalDatasource {
  @override
  Future<List<HotelResponseModel>> getHotels() async {
    const String path = 'assets/dataset/traveloka.json';
    final String response = await rootBundle.loadString(path);
    List<HotelResponseModel> data = [];
    for (Map<String, dynamic> item in jsonDecode(response)) {
      data.add(HotelResponseModel.fromJson(item["data"]));
    }
    return data;
  }
}
