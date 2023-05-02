part of 'package:hotelifoz/core.dart';

class AppBoxShadow {
  static List<BoxShadow> primary(BuildContext context) {
    return [
      BoxShadow(
        color: context.color.shadow!.withOpacity(0.06),
        spreadRadius: 2,
        blurRadius: 5,
        offset: const Offset(4, 4), // changes position of shadow
      ),
    ];
  }
}
