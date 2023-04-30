part of 'package:hotelifoz/core.dart';

late Box mainStorage;

class ChangeThemeMode {
  bool get isDark => mainStorage.get("dark_moode") ?? false;

  ThemeMode get myTheme {
    if (isDark) {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }

  Future<void> change() async {
    await mainStorage.put("dark_moode", !isDark);
  }
}
