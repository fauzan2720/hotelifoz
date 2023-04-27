part of 'package:hotelifoz/core.dart';

class FozEmpty extends StatelessWidget {
  final String? message;
  const FozEmpty({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: Center(
        child: Text(message ?? "Empty Data"),
      ),
    );
  }
}
