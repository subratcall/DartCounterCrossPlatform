import 'package:dart_counter/model/carrer_stats.dart';

class Profile {
  final String photoUrl;
  final String username;
  final CareerStats careerStats;

  Profile(this.photoUrl, this.username, this.careerStats);

  Profile.fromJson(Map<String, dynamic> json)
      : photoUrl = json['photoUrl'],
        username = json['username'],
        careerStats = json['careerStats'] != null
            ? CareerStats.fromJson(json['careerStats'])
            : null;

  Map<String, dynamic> toJson() => {
        'photoUrl': photoUrl,
        'username': username,
        'careerStats': careerStats.toJson(),
      };
}
