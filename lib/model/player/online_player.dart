import 'package:dart_counter/model/player/player.dart';
import 'package:dart_counter/model/set.dart';
import 'package:dart_counter/model/stats.dart';

class OnlinePlayer extends Player {
  final String uid;
  final String photoUrl;

  OnlinePlayer(
      {this.uid,
      String name,
      this.photoUrl,
      bool isCurrentTurn,
      bool won,
      int wonSets,
      int wonLegsCurrentSet,
      int pointsLeft,
      List<String> finishRecommendation,
      int lastPoints,
      int dartsThrownCurrentLeg,
      Stats stats,
      List<Set> sets})
      : super(
            name: name,
            isCurrentTurn: isCurrentTurn,
            won: won,
            wonSets: wonSets,
            wonLegsCurrentSet: wonLegsCurrentSet,
            pointsLeft: pointsLeft,
            finishRecommendation: finishRecommendation,
            lastPoints: lastPoints,
            dartsThrownCurrentLeg: dartsThrownCurrentLeg,
            stats: stats,
            sets: sets);

  OnlinePlayer.fromJson(Map<String, dynamic> json)
      : uid = json['uid'] != null ? json['uid'] : null,
        photoUrl = json['photoUrl'] != null ? json['photoUrl'] : null,
        super(
          name: json['name'] != null ? json['name'] : null,
          isCurrentTurn:
              json['isCurrentTurn'] != null ? json['isCurrentTurn'] : null,
          won: json['won'] != null ? json['won'] : null,
          wonSets: json['wonSets'] != null ? json['wonSets'] : null,
          wonLegsCurrentSet: json['wonLegsCurrentSet'] != null
              ? json['wonLegsCurrentSet']
              : null,
          pointsLeft: json['pointsLeft'] != null ? json['pointsLeft'] : null,
          finishRecommendation: json['finishRecommendation'] != null
              ? json['finishRecommendation']
                  .map((value) => value as String)
                  .cast<String>()
                  .toList()
              : null,
          lastPoints: json['lastPoints'] != null ? json['lastPoints'] : null,
          dartsThrownCurrentLeg: json['dartsThrownCurrentLeg'] != null
              ? json['dartsThrownCurrentLeg']
              : null,
          stats: json['stats'] != null ? Stats.fromJson(json['stats']) : null,
          sets: json['sets'] != null
              ? json['sets']
                  .map((value) => Set.fromJson(value))
                  .cast<Set>()
                  .toList()
              : null,
        );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'photoUrl': photoUrl,
        'isCurrentTurn': isCurrentTurn,
        'won': won,
        'wonSets': wonSets,
        'wonLegsCurrentSet': wonLegsCurrentSet,
        'pointsLeft': pointsLeft,
        'finishRecommendation': finishRecommendation,
        'lastPoints': lastPoints,
        'dartsThrownCurrentLeg': dartsThrownCurrentLeg,
        'stats': stats,
        'sets': sets != null ? sets.map((set) => set.toJson()).toList() : null,
      };
}
