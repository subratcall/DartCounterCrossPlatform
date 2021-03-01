import 'package:dart_counter/app_model.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ViewModel<T> extends ChangeNotifier {
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

  T _viewState;

  get viewState => _viewState;

  set viewState(T viewState) {
    _viewState = viewState;
    notifyListeners();
  }

  void showToast(String msg, {double fontSize = 16}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.red,
        textColor: AppColors.white,
        fontSize: fontSize);
  }
}
