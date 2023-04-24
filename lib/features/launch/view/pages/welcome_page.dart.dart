import 'package:flutter/material.dart';
import 'package:hotelifoz/core.dart';
import 'package:hotelifoz/features/home/view/pages/main_page.dart';

class WelcomePage extends StatelessWidget {
  static const routeName = 'welcome_page';

  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.splash,
            width: context.fullHeight,
            height: context.fullHeight,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 550.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x10001010),
                    Color(0xF2101010),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSizes.primary),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome to 👋🏻",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FW.semibold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "Hotelifoz",
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FW.bold,
                    color: Colors.white,
                  ),
                ),
                14.0.height,
                const Text(
                  "Stop membuang banyak waktu\npada tempat yang tidak habitable",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FW.light,
                    color: Colors.white,
                  ),
                ),
                20.0.height,
                FozFormButton(
                  label: "Get Started",
                  onPressed: () =>
                      context.pushReplacementNamed(MainPage.routeName),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
