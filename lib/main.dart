import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hotelifoz/app.dart';
import 'package:hotelifoz/core.dart';
import 'package:hotelifoz/core/utils/injector.dart' as di;
import 'package:hotelifoz/firebase_options.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  di.init();

  if (!kIsWeb && !Platform.isWindows) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  final Directory path = await getTemporaryDirectory();
  Hive.init(path.path);
  mainStorage = await Hive.openBox('mainStorage');

  runApp(const App());
}
