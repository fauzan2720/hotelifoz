import 'package:flutter/material.dart';
import 'package:hotelifoz/core.dart';

class TitleInCard extends StatelessWidget {
  final String title;
  final void Function()? onSeeAllTap;

  const TitleInCard({
    super.key,
    required this.title,
    required this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.primary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: context.color.textPrimary,
              fontSize: 16.0,
              fontWeight: FW.bold,
            ),
          ),
          InkWell(
            onTap: onSeeAllTap,
            child: const Text(
              "See all",
              style: TextStyle(
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
