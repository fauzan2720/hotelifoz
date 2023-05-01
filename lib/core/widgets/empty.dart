part of 'package:hotelifoz/core.dart';

class FozEmpty extends StatelessWidget {
  final String? message;
  const FozEmpty({
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
            AppImages.empty,
            width: context.fullWidth / 1.5,
          ),
        ),
        Text(
          message ?? "Oppss.. Data kosong",
          style: TextStyle(
            color: context.color.textPrimary,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
