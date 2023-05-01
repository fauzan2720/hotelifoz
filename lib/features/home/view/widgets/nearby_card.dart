import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotelifoz/core.dart';
import 'package:hotelifoz/features/home/model/models/hotel_model.dart';

class NearbyCard extends StatelessWidget {
  final HotelModel item;
  final void Function(HotelModel item) onSelectedItem;

  const NearbyCard({
    super.key,
    required this.item,
    required this.onSelectedItem,
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
                color: context.color.background,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(AppSizes.radius),
                ),
                boxShadow: AppBoxShadow.primary(context),
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
                          style: TextStyle(
                            fontWeight: FW.bold,
                            color: context.color.textPrimary,
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
                        style: TextStyle(
                          fontWeight: FW.bold,
                          color: context.color.textPrimary,
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
                      text: item.currencyFormatIDR,
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
