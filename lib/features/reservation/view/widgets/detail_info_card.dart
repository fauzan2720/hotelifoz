import 'package:flutter/material.dart';
import 'package:hotelifoz/core.dart';

class DetailInfoCard extends StatelessWidget {
  final String label;
  final String value;

  const DetailInfoCard({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const ImageIcon(
            AppIcons.check,
            color: AppColors.primary,
            size: 16.0,
          ),
          6.0.width,
          Text(
            label,
            style: TextStyle(
              color: context.color.textPrimary,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              color: context.color.textPrimary,
              fontWeight: FW.semibold,
            ),
          ),
        ],
      ),
    );
  }
}
