import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/app.dart';
import 'package:hotelifoz/core.dart';

class ThemeModeCubit extends Cubit<ThemeMode> {
  final ChangeThemeMode _themeMode;

  ThemeModeCubit(
    this._themeMode,
  ) : super(_themeMode.myTheme);

  Future<void> change() async {
    await _themeMode.change();
    emit(_themeMode.myTheme);
    App.themeNotifier.value = _themeMode.myTheme;
  }
}
