part of 'package:hotelifoz/core.dart';

late Box mainStorage;

class ChangeThemeMode {
  bool get isDark => mainStorage.get("dark_mode") ?? false;

  void dark() => mainStorage.put("dark_mode", !isDark);
}
