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
  Stream<dynamic> get currentUser;

  Future<void> signIn();

  Future<void> signOut();
}

class InstagramAuthServiceImpl implements InstagramAuthService {
  InstagramAuthServiceImpl._();

  @override
  Stream<dynamic> get currentUser =>
      throw UnimplementedError(); // TODO implement

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
}
