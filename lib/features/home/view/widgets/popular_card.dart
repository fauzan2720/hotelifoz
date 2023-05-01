import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotelifoz/core.dart';
import 'package:hotelifoz/features/home/model/models/hotel_model.dart';

class PopularCard extends StatelessWidget {
  final HotelModel item;
  final void Function(HotelModel item) onSelectedItem;

  const PopularCard({
    super.key,
    required this.item,
    required this.onSelectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelectedItem(item),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.radius),
          boxShadow: AppBoxShadow.primary(context),
          color: context.color.background,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: item.imageUrl,
                    width: 84.0,
                    height: 84.0,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    width: 84.0,
                    child: Container(
                      height: 30.0,
                      width: 45.0,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                        ),
                        color: context.color.background,
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
                            style: TextStyle(
                              fontWeight: FW.bold,
                              color: context.color.textPrimary,
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
            16.0.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.fullWidth - 156.0,
                  child: Text(
                    item.name,
                    style: TextStyle(
                      fontWeight: FW.bold,
                      color: context.color.textPrimary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                8.0.height,
                Row(
                  children: [
                    const ImageIcon(
                      AppIcons.location,
                      color: AppColors.primary,
                      size: 18.0,
                    ),
                    8.0.width,
                    SizedBox(
                      width: context.fullWidth - 182.0,
                      child: Text(
                        item.address,
                        style: const TextStyle(
                          color: AppColors.secondary,
                          fontSize: 12.0,
                        ),
                        maxLines: 2,
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
          ],
        ),
      ),
    );
  }
}
