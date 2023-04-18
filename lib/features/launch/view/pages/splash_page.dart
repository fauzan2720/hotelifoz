import 'package:flutter/material.dart';
import 'package:hotelifoz/core/extensions/build_context_ext.dart';
import 'package:hotelifoz/core/constants/images.dart';
import 'package:hotelifoz/features/launch/view/pages/welcome_page.dart.dart';

class SplashPage extends StatelessWidget {
  static const routeName = 'splash_screen';

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 3000),
      () => context.pushReplacementNamed(WelcomePage.routeName),
    );

    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImages.logoLight,
          width: 200.0,
        ),
      ),
    );
  }
}
