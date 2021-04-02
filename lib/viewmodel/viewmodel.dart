import 'dart:async';

import 'package:rxdart/rxdart.dart';

enum ViewState { loading, idle, error, success }

abstract class ViewModel {

  final BehaviorSubject<ViewState> _viewStateController = BehaviorSubject();

  Sink<ViewState> get inputViewState => _viewStateController;
  ValueStream<ViewState> get outputViewState => _viewStateController.stream;

  void dispose() {
    _viewStateController.close();
  }

}