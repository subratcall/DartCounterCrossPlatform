import 'package:dart_counter/model/profile.dart';

enum UserType { anonymous, emailPassword, google, facebook, instagram, remote }

class User {
  final String uid;
  final UserType userType;
  final Profile profile;

  User(this.uid, this.userType, this.profile);
}
