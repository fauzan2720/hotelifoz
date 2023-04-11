import 'package:flutter/material.dart';
import 'package:hotelifoz/core/extensions/double_ext.dart';
import 'package:hotelifoz/core/themes/colors.dart';
import 'package:hotelifoz/core/themes/font_weight.dart';
import 'package:hotelifoz/core/themes/sizes.dart';
import 'package:hotelifoz/features/home/domain/entities/hotel_entity.dart';
import 'package:hotelifoz/features/home/presentation/widgets/saved_destination_card.dart';

class SavedDestinationsPage extends StatelessWidget {
  const SavedDestinationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.primary),
      child: ListView(
        children: [
          30.0.height,
          const Text(
            "Saved Destinations",
            style: TextStyle(
              color: AppColors.dark,
              fontSize: 16.0,
              fontWeight: FW.bold,
            ),
          ),
          20.0.height,
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return SavedDestinationCard(
                item: HotelEntity(
                  name:
                      "namenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamename",
                  address:
                      "addressaddressaddressaddressaddressaddressaddressaddressaddressaddressaddressaddressaddress",
                  price: 123321,
                  rating: 4.2,
                  imageUrl: "https://picsum.photos/1000",
                  totalReviews: 60229,
                ),
                onSelectedItem: (item) {},
              );
            },
          ),
        ],
      ),
    );
  }
}
