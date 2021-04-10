import 'package:dart_counter/model/player/player.dart';
import 'package:dart_counter/model/set.dart';
import 'package:dart_counter/model/stats.dart';

class OfflinePlayer extends Player {
  OfflinePlayer({
      String name,
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

  OfflinePlayer.fromJson(Map<String, dynamic> json)
      : super(
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
        'name': name,
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
