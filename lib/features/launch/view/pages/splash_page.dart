import 'package:flutter/material.dart';
import 'package:hotelifoz/core.dart';
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
          context.color.background == AppColors.dark
              ? AppImages.logoDark
              : AppImages.logoLight,
          width: 200.0,
        ),
      ),
    );
  }
}
