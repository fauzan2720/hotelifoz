import 'package:flutter/material.dart';
import 'package:hotelifoz/core/extensions/double_ext.dart';
import 'package:hotelifoz/features/home/domain/entities/hotel_entity.dart';

class DetailHotelPage extends StatelessWidget {
  static const String routeName = 'detail_hotel_page';
  final HotelEntity item;

  const DetailHotelPage({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          400.0.height,
          Center(child: Text(item.name)),
        ],
      ),
    );
  }
}
