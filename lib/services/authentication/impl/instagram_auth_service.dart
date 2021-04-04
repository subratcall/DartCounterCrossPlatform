import 'package:rxdart/rxdart.dart';

abstract class InstagramAuthService {
  static InstagramAuthService _instance = InstagramAuthServiceImpl._();

  /// SINGLETON INSTANCE
  static InstagramAuthService get instance {
    if (_instance == null) {
      _instance = InstagramAuthServiceImpl._();
    }
    return _instance;
  }

  /// INTERFACE
  ValueStream<dynamic> get currentUser;

  Future<void> signIn();

  Future<void> signOut();
}

class InstagramAuthServiceImpl implements InstagramAuthService {
  BehaviorSubject<dynamic> _userController = BehaviorSubject();

  InstagramAuthServiceImpl._();

  @override
  ValueStream<dynamic> get currentUser => _userController.stream;

  @override
  Future<void> signOut() {
    // TODO implement
    throw UnimplementedError();
  }

  @override
  Future<void> signIn() {
    // TODO implement
    throw UnimplementedError();
  }

  void dispose() {
    _userController.close();
  }
}
