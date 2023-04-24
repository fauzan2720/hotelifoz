part of 'package:hotelifoz/core.dart';

class FozError extends StatelessWidget {
  final String? message;
  const FozError({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: Center(
        child: Text(message ?? "Error"),
      ),
    );
  }
}
