import 'package:dart_counter/app_settings.dart';
import 'package:flutter/foundation.dart';

class AppModel extends ChangeNotifier {

  AppSettings _settings;

  AppModel() : _settings = AppSettings();

  AppSettings get settings => _settings;

  set settings(AppSettings settings) {
    _settings = settings;
    notifyListeners();
  }
}
