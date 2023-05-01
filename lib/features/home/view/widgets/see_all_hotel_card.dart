import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotelifoz/core.dart';
import 'package:hotelifoz/features/home/model/models/hotel_model.dart';

class SeeAllHotelCard extends StatelessWidget {
  final double width;
  final double height;
  final HotelModel item;
  final void Function(HotelModel item) onSelectedItem;

  const SeeAllHotelCard({
    super.key,
    required this.height,
    required this.width,
    required this.item,
    required this.onSelectedItem,
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
          color: context.color.background,
          borderRadius: BorderRadius.circular(AppSizes.radius),
          boxShadow: AppBoxShadow.primary(context),
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
            Container(
              width: context.fullWidth,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.name,
                    style: TextStyle(
                      fontWeight: FW.semibold,
                      color: context.color.textPrimary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
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
            )
          ],
        ),
      ),
    );
  }
}
