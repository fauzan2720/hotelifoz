import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotelifoz/core/extensions/build_context_ext.dart';
import 'package:hotelifoz/core/extensions/double_ext.dart';
import 'package:hotelifoz/core/themes/box_shadows.dart';
import 'package:hotelifoz/core/themes/colors.dart';
import 'package:hotelifoz/core/themes/font_weight.dart';
import 'package:hotelifoz/core/themes/icons.dart';
import 'package:hotelifoz/core/themes/sizes.dart';
import 'package:hotelifoz/features/home/domain/entities/hotel_entity.dart';

class SeeAllHotelCard extends StatelessWidget {
  final double width;
  final double height;
  final HotelEntity item;
  final void Function(HotelEntity item) onSelectedItem;

  const SeeAllHotelCard({
    required this.height,
    required this.width,
    required this.item,
    required this.onSelectedItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelectedItem(item),
      child: Container(
        margin: const EdgeInsets.all(5.0),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSizes.radius),
          boxShadow: AppBoxShadow.bottom,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(AppSizes.radius),
              ),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: item.imageUrl,
                    fit: BoxFit.cover,
                    width: context.fullWidth,
                    height: height - 50.0,
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 30.0,
                      width: 45.0,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                        ),
                        color: AppColors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const ImageIcon(
                            AppIcons.star,
                            color: AppColors.yellow,
                            size: 16.0,
                          ),
                          4.0.width,
                          Text(
                            item.rating.toString().substring(0, 3),
                            style: const TextStyle(
                              fontWeight: FW.bold,
                              color: AppColors.dark,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: context.fullWidth,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FW.semibold,
                      color: AppColors.dark,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text.rich(
                    TextSpan(
                      text: item.currencyFormat,
                      style: const TextStyle(
                        fontWeight: FW.semibold,
                        color: AppColors.primary,
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
