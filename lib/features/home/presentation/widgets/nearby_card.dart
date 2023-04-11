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

class NearbyCard extends StatelessWidget {
  final HotelEntity item;
  final void Function(HotelEntity item) onSelectedItem;

  const NearbyCard({
    required this.item,
    required this.onSelectedItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelectedItem(item),
      child: Container(
        margin: const EdgeInsets.only(bottom: 5.0),
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        width: 260.0,
        height: 310.0,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(AppSizes.radius),
              ),
              child: CachedNetworkImage(
                imageUrl: item.imageUrl,
                width: context.fullWidth,
                height: 200.0,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 80.0, horizontal: 100.0),
                  child: const CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(AppSizes.radius),
                ),
                boxShadow: AppBoxShadow.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: context.fullWidth - 232.5,
                        child: Text(
                          item.name,
                          style: const TextStyle(
                            fontWeight: FW.bold,
                            color: AppColors.dark,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      const ImageIcon(
                        AppIcons.star,
                        color: AppColors.yellow,
                        size: 16.0,
                      ),
                      8.0.width,
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
                  8.0.height,
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const ImageIcon(
                        AppIcons.location,
                        color: AppColors.primary,
                        size: 18.0,
                      ),
                      8.0.width,
                      Flexible(
                        child: Text(
                          item.address,
                          style: const TextStyle(
                            color: AppColors.secondary,
                            fontSize: 12.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  8.0.height,
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
            ),
          ],
        ),
      ),
    );
  }
}
