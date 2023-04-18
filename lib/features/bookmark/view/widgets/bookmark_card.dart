import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotelifoz/core/extensions/build_context_ext.dart';
import 'package:hotelifoz/core/extensions/double_ext.dart';
import 'package:hotelifoz/core/constants/box_shadows.dart';
import 'package:hotelifoz/core/constants/colors.dart';
import 'package:hotelifoz/core/constants/font_weight.dart';
import 'package:hotelifoz/core/constants/icons.dart';
import 'package:hotelifoz/core/constants/sizes.dart';
import 'package:hotelifoz/features/home/domain/entities/hotel_entity.dart';

class BookmarkCard extends StatelessWidget {
  final HotelEntity item;
  final void Function(HotelEntity item) onSelectedItem;
  final void Function(HotelEntity item) onBookmarkTap;

  const BookmarkCard({
    required this.item,
    required this.onSelectedItem,
    required this.onBookmarkTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: () => onSelectedItem(item),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppSizes.radius),
            boxShadow: AppBoxShadow.primary,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.radius),
                child: CachedNetworkImage(
                  imageUrl: item.imageUrl,
                  width: 84.0,
                  height: 84.0,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              16.0.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: context.fullWidth - 188.0,
                    child: Text(
                      item.name,
                      style: const TextStyle(
                        color: AppColors.secondary,
                        fontSize: 12.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
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
                  8.0.height,
                  Row(
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
                      4.0.width,
                      Text(
                        "(${item.totalReviewsFormat} reviews)",
                        style: const TextStyle(
                          color: AppColors.secondary,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () => onBookmarkTap(item),
                icon: const ImageIcon(
                  AppIcons.saved,
                  size: 18.0,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
