part of dart_game;

class DartBot extends Player {
  int targetAverage;

  DartBot(Game game, {this.targetAverage = 0}) : super(game, -1);

  @override
  String toString() {
    return 'DartBot{targetAverage: $targetAverage, player: Player{id: $id, name: $name, isCurrentTurn: $isCurrentTurn, won: $won, wonSets: $wonSets, wonLegsCurrentSet: $wonLegsCurrentSet, pointsLeft: $pointsLeft, lastPoints: $lastPoints, dartsThrownCurrentLeg: $dartsThrownCurrentLeg, stats: $stats, sets: $sets}}';
  }
}
