import 'package:dart_counter/model/carrer_stats.dart';

class Profile {

  String photoUrl;
  String username;
  CarrerStats carrerStats;

  Profile(this.photoUrl, this.username, this.carrerStats);

  Profile.dummy() {
    photoUrl = 'www.example.com';
    username = 'dummyUsername';
    carrerStats = CarrerStats.dummy();
  }

  Profile.fromJson(Map<String, dynamic> json) {
    photoUrl = json['photoUrl'];
    username = json['username'];
    carrerStats = CarrerStats.fromJson(json['carrerStats']);
  }

  Map<String, dynamic> toJson() => {
    'photoUrl' : photoUrl,
    'username' : username,
    'carrerStats' : carrerStats.toJson(),
  };
}