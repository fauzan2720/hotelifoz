import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotelifoz/core.dart';
import 'package:hotelifoz/features/home/model/models/hotel_model.dart';

class BookmarkCard extends StatelessWidget {
  final HotelModel item;
  final void Function(HotelModel item) onSelectedItem;
  final void Function(HotelModel item) onBookmarkTap;

  const BookmarkCard({
    super.key,
    required this.item,
    required this.onSelectedItem,
    required this.onBookmarkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: () => onSelectedItem(item),
        child: Container(
          decoration: BoxDecoration(
            color: context.color.background,
            borderRadius: BorderRadius.circular(AppSizes.radius),
            boxShadow: AppBoxShadow.primary(context),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.radius),
                child: Hero(
                  tag: item.id,
                  child: CachedNetworkImage(
                    imageUrl: item.imageUrl,
                    width: 84.0,
                    height: 84.0,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
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
                        style: TextStyle(
                          fontWeight: FW.bold,
                          color: context.color.textPrimary,
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
    ).animate().fadeIn();
  }
}
