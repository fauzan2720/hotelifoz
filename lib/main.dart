import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hotelifoz/app.dart';
import 'package:hotelifoz/core.dart';
import 'package:hotelifoz/core/utils/injector.dart' as di;
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  final Directory path = await getTemporaryDirectory();
  Hive.init(path.path);
  mainStorage = await Hive.openBox('mainStorage');
  runApp(const App());
}
