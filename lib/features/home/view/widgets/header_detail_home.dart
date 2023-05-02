import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/core.dart';
import 'package:hotelifoz/features/home/model/models/hotel_model.dart';

class HeaderDetailHome extends StatelessWidget {
  final HotelModel item;
  final void Function(HotelModel item) onSaved;

  const HeaderDetailHome({
    super.key,
    required this.item,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Hero(
            tag: item.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: CachedNetworkImage(
                imageUrl: item.imageUrl,
                fit: BoxFit.cover,
                width: context.fullWidth,
                height: 495.0,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          height: 495.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20.0),
                  ),
                  color: context.color.textPrimary!.withOpacity(0.1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => context.pop(),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 1,
                            color: AppColors.white,
                          ),
                        ),
                        child: ClipPath(
                          child: Container(
                            color: const Color(0x4DFFFFFF),
                            child: Center(
                              child: Icon(
                                Icons.chevron_left,
                                color: context.color.background,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Details",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FW.bold,
                        color: context.color.background,
                        shadows: const [
                          Shadow(
                            color: AppColors.secondary,
                            offset: Offset(0, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 40.0,
                      child: IconButton(
                        onPressed: () => onSaved(item),
                        icon: BlocBuilder<IsBookmarkCubit, bool>(
                          builder: (context, state) {
                            return ImageIcon(
                              state ? AppIcons.saved : AppIcons.notSaved,
                              size: 18.0,
                              color: state
                                  ? AppColors.primary
                                  : context.color.background,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(14.0),
                padding: const EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.radius),
                  color: context.color.background,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                              fontSize: 16.0,
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
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const ImageIcon(
                          AppIcons.star,
                          color: AppColors.yellow,
                          size: 20.0,
                        ),
                        8.0.width,
                        Text(
                          item.rating.toString().substring(0, 3),
                          style: TextStyle(
                            color: context.color.textPrimary,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
