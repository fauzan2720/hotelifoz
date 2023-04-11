import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotelifoz/core/extensions/double_ext.dart';
import 'package:hotelifoz/core/themes/colors.dart';
import 'package:hotelifoz/core/themes/font_weight.dart';
import 'package:hotelifoz/core/themes/icons.dart';
import 'package:hotelifoz/core/themes/sizes.dart';
import 'package:hotelifoz/core/widgets/form_button.dart';
import 'package:hotelifoz/features/home/domain/entities/hotel_entity.dart';
import 'package:hotelifoz/features/home/presentation/widgets/header_detail_home.dart';

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
          HeaderDetailHome(item),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.primary),
            child: SizedBox(
              height: 32.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: item.facilities.length,
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: AppColors.card,
                  ),
                  child: Text(
                    item.facilities[index].toUpperCase(),
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: AppColors.dark,
                    ),
                  ),
                ),
              ),
            ),
          ),
          24.0.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.primary),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Features",
                  style: TextStyle(
                    fontWeight: FW.bold,
                    color: AppColors.dark,
                  ),
                ),
                12.0.height,
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: item.features.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 7.0,
                    crossAxisCount: 2,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                  ),
                  itemBuilder: (context, index) => Row(
                    children: [
                      const ImageIcon(
                        AppIcons.check,
                        size: 16.0,
                        color: AppColors.primary,
                      ),
                      6.0.width,
                      Text(
                        item.features[index],
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: AppColors.dark,
                        ),
                      ),
                    ],
                  ),
                ),
                24.0.height,
                const Text(
                  "Preview",
                  style: TextStyle(
                    fontWeight: FW.bold,
                    color: AppColors.dark,
                  ),
                ),
              ],
            ),
          ),
          12.0.height,
          SizedBox(
            height: 82.0,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.primary - 8.0),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: item.images.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: CachedNetworkImage(
                    imageUrl: item.images[index],
                    fit: BoxFit.cover,
                    width: 98.0,
                    height: 82.0,
                  ),
                ),
              ),
            ),
          ),
          30.0.height,
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.primary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text.rich(
                  TextSpan(
                    text: item.currencyFormat,
                    style: const TextStyle(
                      fontWeight: FW.semibold,
                      color: AppColors.primary,
                      fontSize: 18.0,
                    ),
                    children: const [
                      TextSpan(
                        text: " /night",
                        style: TextStyle(
                          color: AppColors.secondary,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  item.address,
                  style: const TextStyle(
                    fontWeight: FW.light,
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
            FozFormButton(
              label: "Book Now",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
