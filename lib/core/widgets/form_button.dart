part of 'package:hotelifoz/core.dart';

class FozFormButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final Color? backgroundColor;
  final double? width;
  final double? height;

  const FozFormButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      clipBehavior: Clip.none,
      onPressed: onPressed,
      child: Container(
        height: height ?? 50.0,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.radius),
          color: backgroundColor ?? AppColors.primary,
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
