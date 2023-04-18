import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hotelifoz/core/extensions/build_context_ext.dart';
import 'package:hotelifoz/core/extensions/double_ext.dart';
import 'package:hotelifoz/core/constants/colors.dart';
import 'package:hotelifoz/core/constants/font_weight.dart';
import 'package:hotelifoz/core/constants/icons.dart';
import 'package:hotelifoz/core/constants/sizes.dart';
import 'package:hotelifoz/features/bookmark/view_model/is_bookmark/is_bookmark_cubit.dart';
import 'package:hotelifoz/features/home/domain/entities/hotel_entity.dart';

class HeaderDetailHome extends StatelessWidget {
  final HotelEntity item;
  final void Function(HotelEntity item) onSaved;

  const HeaderDetailHome({
    required this.item,
    required this.onSaved,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
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
                  color: AppColors.dark.withOpacity(0.1),
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
                            width: 2,
                            color: AppColors.white,
                          ),
                        ),
                        child: ClipPath(
                          child: Container(
                            color: const Color(0x4DFFFFFF),
                            child: const Center(
                              child: Icon(
                                Icons.chevron_left,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "Details",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FW.bold,
                        color: AppColors.white,
                        shadows: [
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
                              color:
                                  state ? AppColors.primary : AppColors.white,
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
                  color: AppColors.white,
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
                            style: const TextStyle(
                              fontWeight: FW.bold,
                              color: AppColors.dark,
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
                          style: const TextStyle(
                            color: AppColors.dark,
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
