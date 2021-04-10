import 'package:dart_counter/model/set.dart';
import 'package:dart_counter/model/stats.dart';

abstract class Player {

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

  Player(
  {this.name,
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
}