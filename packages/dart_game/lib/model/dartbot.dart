part of dart_game;

class DartBot extends Player {
  int targetAverage;

  DartBot({this.targetAverage = 20}) : super('Dartbot');

  @override
  String toString() {
    return 'DartBot{targetAverage: $targetAverage, lastThrow: $lastThrow, pointsLeft: $pointsLeft, dartsThrown: $dartsThrown, sets: $sets, legs: $legs, average: $average, checkoutPercentage: $checkoutPercentage, isWinner: $isWinner}';
  }
}
