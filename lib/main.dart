import 'dart:io';

import 'package:dart_counter/view/android/app.dart';
import 'package:dart_counter/view/ios/app.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ); //
  await Firebase.initializeApp();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode && false,
      builder: (context) => DartCounterApp(),
    ),
  );
}

// TODO maybe make stateful to dispose streams and services
class DartCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DartCounterAppIOS();
    return Platform.isIOS ? DartCounterAppIOS() : DartCounterAppAndroid();
  }
}
