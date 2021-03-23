part of dart_game;

class Leg {
  ///
  /// PUBLIC
  ///

  bool get won => _won;
  Stats get stats => _stats;

  final List<Throw> throws;

  Leg(this._startingPoints) : throws = [];

  ///
  /// PRIVATE
  ///

  /// computed properties for interface
  bool get _won => _startingPoints == _points;

  Stats get _stats => Stats(
      average: _average,
      checkoutPercentage: _checkoutPercentage,
      firstNineAverage: _firstNineAverage,
      fourtyPlus: _fourtyPlus,
      sixtyPlus: _sixtyPlus,
      eightyPlus: _eightyPlus,
      hundredPlus: _hundredPlus,
      hundredTwentyPlus: _hundredTwentyPlus,
      hundredFourtyPlus: _hundredFourtyPlus,
      hundredSixtyPlus: _hundredSixtyPlus,
      hundredEighty: _hundredEighty);

  double get _average {
    if (_dartsThrown == 0) return 0;
    return (3 * _points) / _dartsThrown;
  }

  double get _checkoutPercentage => _won ? 1 / _dartsOnDouble : 0;

  double get _firstNineAverage {
    int index = 0;
    int points = 0;
    int dartsThrown = 0;
    for (Throw t in throws) {
      points += t.points;
      dartsThrown += t.dartsThrown;
      index++;
      if (index == 3) break;
    }
    if (dartsThrown == 0) return 0;
    return (3 * points) / dartsThrown;
  }

  int get _fourtyPlus {
    int fourtyPlus = 0;
    for (Throw t in throws) {
      if (t.points >= 40 && t.points < 60) {
        fourtyPlus++;
      }
    }
    return fourtyPlus;
  }

  int get _sixtyPlus {
    int sixtyPlus = 0;
    for (Throw t in throws) {
      if (t.points >= 60 && t.points < 80) {
        sixtyPlus++;
      }
    }
    return sixtyPlus;
  }

  int get _eightyPlus {
    int eightyPlus = 0;
    for (Throw t in throws) {
      if (t.points >= 80 && t.points < 100) {
        eightyPlus++;
      }
    }
    return eightyPlus;
  }

  int get _hundredPlus {
    int hundredPlus = 0;
    for (Throw t in throws) {
      if (t.points >= 100 && t.points < 120) {
        hundredPlus++;
      }
    }
    return hundredPlus;
  }

  int get _hundredTwentyPlus {
    int hundredTwentyPlus = 0;
    for (Throw t in throws) {
      if (t.points >= 120 && t.points < 140) {
        hundredTwentyPlus++;
      }
    }
    return hundredTwentyPlus;
  }

  int get _hundredFourtyPlus {
    int hundredFourtyPlus = 0;
    for (Throw t in throws) {
      if (t.points >= 140 && t.points < 160) {
        hundredFourtyPlus++;
      }
    }
    return hundredFourtyPlus;
  }

  int get _hundredSixtyPlus {
    int hundredSixtyPlus = 0;
    for (Throw t in throws) {
      if (t.points >= 160 && t.points < 180) {
        hundredSixtyPlus++;
      }
    }
    return hundredSixtyPlus;
  }

  int get _hundredEighty {
    int hundredEighty = 0;
    for (Throw t in throws) {
      if (t.points == 180) {
        hundredEighty++;
      }
    }
    return hundredEighty;
  }

  /// internal properties
  final int _startingPoints;

  int get _points {
    int points = 0;
    for (Throw t in throws) {
      points += t.points;
    }
    return points;
  }

  int get _pointsLeft => _startingPoints - _points;

  int get _lastPoints => throws.length > 0 ? throws.last.points : null;

  int get _dartsThrown {
    int dartsThrown = 0;
    for (Throw t in throws) {
      dartsThrown += t.dartsThrown;
    }
    return dartsThrown;
  }

  int get _dartsOnDouble {
    int dartsOnDouble = 0;
    for (Throw t in throws) {
      dartsOnDouble += t.dartsOnDouble;
    }
    return dartsOnDouble;
  }

  int get _finish {
    return _won ? throws.last.points : null;
  }

  @override
  String toString() {
    return 'Leg{won: $won, stats: $stats, throws: $throws}';
  }
}
