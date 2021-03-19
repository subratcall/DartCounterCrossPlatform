part of dart_game;

class Throw {

  String id;
  int points;
  int dartsOnDouble;
  int dartsThrown;
  int playerIndex;

  Throw(this.points, [this.dartsThrown = 3, this.dartsOnDouble = 0]) : id = Uuid().v4();

  /*Throw.fromJson(Map<String, dynamic> json) {
    points = json['points'];
    dartsOnDouble = json['dartsOnDouble'];
    dartsThrown = json['dartsThrown'];
    playerIndex = json['playerIndex'];
  }

  Map<String, dynamic> toJson() => {
    'points' : points,
    'dartsOnDouble' : dartsOnDouble,
    'dartsThrown' : dartsThrown,
    'playerIndex' : playerIndex,
  };*/

  @override
  String toString() {
    return 'Throw{points: $points, dartsOnDouble: $dartsOnDouble, dartsThrown: $dartsThrown, playerIndex: $playerIndex}';
  }

  @override
  bool operator ==(other) {
    Throw t = other;
    return this.points == t.points &&
        this.dartsOnDouble == t.dartsOnDouble &&
        this.dartsThrown == t.dartsThrown &&
        this.playerIndex == t.playerIndex;
  }
}
