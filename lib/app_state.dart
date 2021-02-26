import 'package:dart_counter/app_settings.dart';
import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  AppSettings _settings;

  AppState() : _settings = AppSettings();

  AppSettings get settings => _settings;

  set settings(AppSettings settings) {
    _settings = settings;
    notifyListeners();
  }
}
