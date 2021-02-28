import 'package:dart_counter/app_model.dart';
import 'package:dart_counter/locator.dart';
import 'package:flutter/cupertino.dart';

enum ViewState { Idle, Busy }

class ViewModel extends ChangeNotifier {
  /**
   *  final SessionService sessionService = locator<SessionService>();


      Session _session;

      BaseModel() {
      _session = sessionService.session;
      sessionService.onEvent.listen((event) {
      _setSession(event.item);
      });
      }

      ViewState get state => _state;

      bool get connected => _session.connected;

      bool get authenticated => _session.user != null;

      User get user => _session.user;

      void _setSession(Session session) {
      _session = session;
      notifyListeners();
      }
   */

  AppModel app = locator<AppModel>();

  ViewState _state = ViewState.Idle;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
