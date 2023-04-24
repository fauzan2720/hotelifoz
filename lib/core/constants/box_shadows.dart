part of 'package:hotelifoz/core.dart';

class AppBoxShadow {
  static List<BoxShadow> primary = [
    BoxShadow(
      color: AppColors.dark.withOpacity(0.06),
      spreadRadius: 2,
      blurRadius: 5,
      offset: const Offset(4, 4), // changes position of shadow
    ),
  ];
}
