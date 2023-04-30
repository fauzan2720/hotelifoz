import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/core.dart';

class ThemeModeCubit extends Cubit<bool> {
  final ChangeThemeMode _themeMode;

  ThemeModeCubit(this._themeMode) : super(_themeMode.isDark);

  void change() {
    _themeMode.dark();
    emit(_themeMode.isDark);
  }
}
