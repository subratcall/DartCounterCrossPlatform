part of dart_game;

class Throw {
  final int points;
  final int dartsOnDouble;
  final int dartsThrown;

  Throw(this.points, {this.dartsThrown = 3, this.dartsOnDouble = 0});

  @override
  String toString() {
    return 'Throw{points: $points, dartsOnDouble: $dartsOnDouble, dartsThrown: $dartsThrown}';
  }
}
