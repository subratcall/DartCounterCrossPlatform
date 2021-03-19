part of dart_game;

class Leg {

  String id;
  List<int> pointsLeft;
  List<int> dartsThrown;
  List<int> dartsOnDouble;
  List<Throw> throws;
  int startIndex;

  Leg(this.startIndex, int numberOfPlayers, int startingPoints)
      : this.pointsLeft = List.filled(numberOfPlayers, startingPoints),
        this.dartsThrown = List.filled(numberOfPlayers, 0),
        this.dartsOnDouble = List.filled(numberOfPlayers, 0),
        this.throws = [];


  /*Leg.fromJson(Map<String, dynamic> json) {
    pointsLeft = json['pointsLeft'];
    dartsThrown = json['dartsThrown'];
    dartsOnDouble = json['dartsOnDouble'];
    throws = json['throws'] != null ? json['throws'].map((value) => value != null ? Throw.fromJson(value) : null).toList() : [];
    startIndex = json['startIndex'];
  }

  Map<String, dynamic> toJson() => {
    'pointsLeft': pointsLeft,
    'dartsThrown': dartsThrown,
    'dartsOnDouble': dartsOnDouble,
    'throws': throws,
    'startIndex': startIndex,
  };
*/
  void performThrow(Throw t) {
    this.pointsLeft[t.playerIndex] -= t.points;
    this.dartsThrown[t.playerIndex] += t.dartsThrown;
    this.dartsOnDouble[t.playerIndex] += t.dartsOnDouble;
    this.throws.add(t);
  }

  Throw undoThrow() {
    Throw last = this.throws.last;
    this.pointsLeft[last.playerIndex] += last.points;
    this.dartsThrown[last.playerIndex] -= last.dartsThrown;
    this.dartsOnDouble[last.playerIndex] -= last.dartsOnDouble;
    this.throws.removeLast();
    return last;
  }

  int get winner {
    return pointsLeft.indexOf(0);
  }

  @override
  String toString() {
    return 'Leg{pointsLeft: $pointsLeft, dartsThrown: $dartsThrown, dartsOnDouble: $dartsOnDouble, throws: $throws, startIndex: $startIndex}';
  }

  @override
  bool operator ==(other) {
    Leg o = other;
    return listEquals(this.pointsLeft, o.pointsLeft) &&
        listEquals(this.dartsThrown, o.dartsThrown) &&
        listEquals(this.dartsOnDouble, o.dartsOnDouble) &&
        listEquals(this.throws, o.throws) &&
        this.startIndex == o.startIndex;
  }
}
