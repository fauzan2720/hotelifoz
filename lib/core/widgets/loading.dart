import 'package:flutter/material.dart';

class FozLoading extends StatelessWidget {
  const FozLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200.0,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
