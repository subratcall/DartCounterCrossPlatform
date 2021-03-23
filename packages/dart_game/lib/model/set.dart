part of dart_game;

class Set {
  ///
  /// PUBLIC
  ///

  bool get won => _won;
  Stats get stats => _stats;

  final List<Leg> legs;

  Set(this._startingPoints, this._legsNeededToWin) : legs = [Leg(_startingPoints)];

  ///
  /// PRIVATE
  ///

  /// computed properties for interface
  bool get _won => _legsNeededToWin == _wonLegs;

  Stats get _stats => Stats(
      average: _average,
      checkoutPercentage: _checkoutPercentage,
      firstNineAverage: _firstNineAverage,
      highestFinish: _highestFinish,
      fourtyPlus: _fourtyPlus,
      sixtyPlus: _sixtyPlus,
      eightyPlus: _eightyPlus,
      hundredPlus: _hundredPlus,
      hundredTwentyPlus: _hundredTwentyPlus,
      hundredFourtyPlus: _hundredFourtyPlus,
      hundredSixtyPlus: _hundredSixtyPlus,
      hundredEighty: _hundredEighty);

  double get _average {
    int points = 0;
    int dartsThrown = 0;
    for (Leg leg in legs) {
      points += leg._points;
      dartsThrown += leg._dartsThrown;
    }
    if (dartsThrown == 0) return 0;
    return (3 * points) / dartsThrown;
  }

  double get _checkoutPercentage => _wonLegs == 0 ? 0 : _wonLegs / _dartsOnDouble;

  double get _firstNineAverage {
    int points = 0;
    int dartsThrown = 0;
    for (Leg leg in legs) {
      int index = 0;
      for (Throw t in leg.throws) {
        points += t.points;
        dartsThrown += t.dartsThrown;
        index++;
        if (index == 3) break;
      }
    }
    if (dartsThrown == 0) return 0;
    return (3 * points) / dartsThrown;
  }

  int get _highestFinish {
    List<int> nonNullFinishes = List.from(_finishes);
    nonNullFinishes.removeWhere((element) => element == null);
    if (nonNullFinishes.isEmpty) return null;
    return nonNullFinishes.reduce(max);
  }

  int get _fourtyPlus {
    int fourtyPlus = 0;
    for (Leg leg in legs) {
      fourtyPlus += leg._fourtyPlus;
    }
    return fourtyPlus;
  }

  int get _sixtyPlus {
    int sixtyPlus = 0;
    for (Leg leg in legs) {
      sixtyPlus += leg._sixtyPlus;
    }
    return sixtyPlus;
  }

  int get _eightyPlus {
    int eightyPlus = 0;
    for (Leg leg in legs) {
      eightyPlus += leg._eightyPlus;
    }
    return eightyPlus;
  }

  int get _hundredPlus {
    int hundredPlus = 0;
    for (Leg leg in legs) {
      hundredPlus += leg._hundredPlus;
    }
    return hundredPlus;
  }

  int get _hundredTwentyPlus {
    int hundredTwentyPlus = 0;
    for (Leg leg in legs) {
      hundredTwentyPlus += leg._hundredTwentyPlus;
    }
    return hundredTwentyPlus;
  }

  int get _hundredFourtyPlus {
    int hundredFourtyPlus = 0;
    for (Leg leg in legs) {
      hundredFourtyPlus += leg._hundredFourtyPlus;
    }
    return hundredFourtyPlus;
  }

  int get _hundredSixtyPlus {
    int hundredSixtyPlus = 0;
    for (Leg leg in legs) {
      hundredSixtyPlus += leg._hundredSixtyPlus;
    }
    return hundredSixtyPlus;
  }

  int get _hundredEighty {
    int hundredEighty = 0;
    for (Leg leg in legs) {
      hundredEighty += leg._hundredEighty;
    }
    return hundredEighty;
  }

  /// internal properties
  final int _startingPoints;

  final int _legsNeededToWin;

  Leg get _currentLeg {
    return legs.last;
  }

  // TODO
  Leg get _prevLeg {
    int index = legs.length - 2;
    if (index >= 0) {
      return legs[index];
    }

    return null;
  }

  int get _wonLegs {
    int wonLegs = 0;
    for (Leg leg in legs) {
      if (leg._won) {
        wonLegs++;
      }
    }
    return wonLegs;
  }

  int get _points {
    int points = 0;
    for (Leg leg in legs) {
      points += leg._points;
    }
    return points;
  }

  int get _lastPoints {
    if (_currentLeg._lastPoints == null) {
      return _prevLeg != null ? _prevLeg._lastPoints : null;
    }
    return _currentLeg._lastPoints;
  }

  int get _dartsThrown {
    int dartsThrown = 0;
    for (Leg leg in legs) {
      dartsThrown += leg._dartsThrown;
    }
    return dartsThrown;
  }

  int get _dartsOnDouble {
    int dartsOnDouble = 0;
    for (Leg leg in legs) {
      dartsOnDouble += leg._dartsOnDouble;
    }
    return dartsOnDouble;
  }

  List<int> get _finishes {
    List<int> finishes = [];
    for (Leg leg in legs) {
      finishes.add(leg._finish);
    }
    return finishes;
  }

  /// internal methods
  void _createLeg() {
    legs.add(Leg(_startingPoints));
  }

  void _removeLeg() {
    legs.removeLast();
  }

  @override
  String toString() {
    return 'Set{won: $won, stats: $stats, legs: $legs}';
  }
}
