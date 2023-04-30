part of 'package:hotelifoz/core.dart';

class FozError extends StatelessWidget {
  final String? message;
  const FozError({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        50.0.height,
        Center(
          child: Image.asset(
            AppImages.error,
            width: context.fullWidth / 1.5,
          ),
        ),
        Text(
          message ?? "Error",
          style: TextStyle(
            color: context.color.textPrimary,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
