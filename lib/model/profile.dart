import 'package:dart_counter/model/carrer_stats.dart';

class Profile {

  String photoUrl;
  String username;
  CarrerStats carrerStats;

  Profile(this.photoUrl, this.username, this.carrerStats);

  Profile.fromJson(Map<String, dynamic> json) {
    photoUrl = json['photoUrl'];
    username = json['username'];
    carrerStats = json['carrerStats'];
  }

  Map<String, dynamic> toJson() => {
    'photoUrl' : photoUrl,
    'username' : username,
    'carrerStats' : carrerStats.toJson(),
  };
}