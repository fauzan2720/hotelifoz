import 'package:hotelifoz/core/constants/sizes.dart';

import '../constants/colors.dart';
import 'package:flutter/material.dart';

class FozFormButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final Color? backgroundColor;

  const FozFormButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 28.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.radius),
          color: backgroundColor ?? AppColors.primary,
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
