import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService() : this._firebaseAuth = FirebaseAuth.instance;

  Stream<User> get authStateChanged => _firebaseAuth.authStateChanges();

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Signed in';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'Signed up';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<dynamic> signInFacebook() {
    // TODO implement
  }

  Future<dynamic> signInGoogle() {
    // TODO implement
  }

  Future<dynamic> signInInstagram() {
    // TODO implement
  }


  Future<void> signOut() async {
    _firebaseAuth.signOut();
  }
}
