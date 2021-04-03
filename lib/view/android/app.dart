import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

class DartCounterAppAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        home: Center(
          child: Text('Android is currently not supported'),
        ));
  }
}
