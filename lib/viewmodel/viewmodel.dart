import 'dart:async';

import 'package:dart_counter/app_model.dart';
import 'package:dart_counter/locator.dart';
import 'package:flutter/foundation.dart';

class ViewModel<T> extends ChangeNotifier {
  AppModel appModel = locator<AppModel>();

  List<StreamSubscription> subscriptions = [];

  T _viewState;

  get viewState => _viewState;

  set viewState(T viewState) {
    _viewState = viewState;
    notifyListeners();
  }

  void dispose() {
    for (StreamSubscription subscription in subscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }
}
