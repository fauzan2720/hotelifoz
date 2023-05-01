part of 'package:hotelifoz/core.dart';

class AppThemes {
  static bool isDarkMode(BuildContext context) =>
      context.color.background == AppColors.dark;

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.white,
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          iconTheme: IconThemeData(
            color: AppColors.dark,
          ),
          titleTextStyle: TextStyle(
            color: AppColors.dark,
            fontSize: 22.0,
          ),
        ),
        extensions: const <ThemeExtension<dynamic>>[
          MyColors.light,
        ],
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.dark,
          iconTheme: IconThemeData(
            color: AppColors.white,
          ),
          titleTextStyle: TextStyle(
            color: AppColors.white,
            fontSize: 22.0,
          ),
        ),
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
        extensions: const <ThemeExtension<dynamic>>[
          MyColors.dark,
        ],
      );
}
