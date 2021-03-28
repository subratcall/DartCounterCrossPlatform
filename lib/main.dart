import 'dart:io';

import 'package:dart_counter/locator.dart';
import 'package:dart_counter/view/android/app.dart';
import 'package:dart_counter/view/ios/app.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => DartCounterApp(),
    ),
  );
}

class DartCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? DartCounterAppIOS() : DartCounterAppAndroid();
  }
}
