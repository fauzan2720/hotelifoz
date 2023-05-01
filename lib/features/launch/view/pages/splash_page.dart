import 'package:flutter/material.dart';
import 'package:hotelifoz/core.dart';
import 'package:hotelifoz/features/launch/view/pages/welcome_page.dart.dart';

class SplashPage extends StatelessWidget {
  static const routeName = 'splash_screen';

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3000), () {
      if (context.mounted) {
        context.pushReplacementNamed(WelcomePage.routeName);
      }
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          AppThemes.isDarkMode(context)
              ? AppImages.logoDark
              : AppImages.logoLight,
          width: 200.0,
        ).animate(delay: 500.ms).fadeIn(),
      ),
    );
  }
}
