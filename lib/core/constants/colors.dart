part of 'package:hotelifoz/core.dart';

class AppColors {
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color primary = Color(0xff4C4DDC);
  static const Color secondary = Color(0xff878787);
  static const Color dark = Color(0xff101010);
  static const Color stroke = Color(0xffD6D6D6);
  static const Color yellow = Color(0xffFFD33C);
  static const Color red = Colors.red;
  static const Color card = Color(0xffF5F5FF);
}

class MyColors extends ThemeExtension<MyColors> {
  final Color? background;
  final Color? textPrimary;
  final Color? shadow;

  const MyColors({
    required this.background,
    required this.textPrimary,
    required this.shadow,
  });

  @override
  MyColors copyWith({
    Color? background,
    Color? textPrimary,
    Color? shadow,
  }) {
    return MyColors(
      background: background ?? this.background,
      textPrimary: textPrimary ?? this.textPrimary,
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  MyColors lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      background: Color.lerp(background, other.background, t),
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t),
      shadow: Color.lerp(shadow, other.shadow, t),
    );
  }

  @override
  String toString() => 'AppThemes('
      'background: $background, textPrimary: $textPrimary, shadow: $shadow'
      ')';

  static const MyColors light = MyColors(
    background: AppColors.white,
    textPrimary: AppColors.dark,
    shadow: AppColors.dark,
  );

  static const MyColors dark = MyColors(
    background: AppColors.dark,
    textPrimary: AppColors.white,
    shadow: AppColors.white,
  );
}
