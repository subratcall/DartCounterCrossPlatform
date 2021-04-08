import 'package:dart_counter/model/profile.dart';
import 'package:dart_counter/model/set.dart';
import 'package:dart_counter/model/stats.dart';

class OfflinePlayer {
  final Profile profile;

  final int id;
  final String name;
  final bool isCurrentTurn;
  final bool won;
  final int wonSets;
  final int wonLegsCurrentSet;
  final int pointsLeft;
  final List<String> finishRecommendation;
  final int lastPoints;
  final int dartsThrownCurrentLeg;
  final Stats stats;

  final List<Set> sets;

  OfflinePlayer(
      {this.profile,
      this.id,
      this.name,
      this.isCurrentTurn,
      this.won,
      this.wonSets,
      this.wonLegsCurrentSet,
      this.pointsLeft,
      this.finishRecommendation,
      this.lastPoints,
      this.dartsThrownCurrentLeg,
      this.stats,
      this.sets});

  OfflinePlayer.fromJson(Map<String, dynamic> json)
      : profile =
            json['profile'] != null ? Profile.fromJson(json['profile']) : null,
        id = json['id'] != null ? json['id'] : null,
        name = json['name'] != null ? json['name'] : null,
        isCurrentTurn =
            json['isCurrentTurn'] != null ? json['isCurrentTurn'] : null,
        won = json['won'] != null ? json['won'] : null,
        wonSets = json['wonSets'] != null ? json['wonSets'] : null,
        wonLegsCurrentSet = json['wonLegsCurrentSet'] != null
            ? json['wonLegsCurrentSet']
            : null,
        pointsLeft = json['pointsLeft'] != null ? json['pointsLeft'] : null,
        finishRecommendation = json['finishRecommendation'] != null
            ? json['finishRecommendation']
                .map((value) => value as String)
                .cast<String>()
                .toList()
            : null,
        lastPoints = json['lastPoints'] != null ? json['lastPoints'] : null,
        dartsThrownCurrentLeg = json['dartsThrownCurrentLeg'] != null
            ? json['dartsThrownCurrentLeg']
            : null,
        stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null,
        sets = json['sets'] != null
            ? json['sets']
                .map((value) => Set.fromJson(value))
                .cast<Set>()
                .toList()
            : null;

  Map<String, dynamic> toJson() => {
        'profile': profile,
        'id': id,
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
