part of dart_game;

class Player {
  ///
  /// PUBLIC
  ///

  final int id;
  String name;
  bool get isCurrentTurn => _isCurrentTurn;
  bool get won => _won;
  int get wonSets => _game._config.type == Type.legs ? null : _wonSets;
  int get wonLegsCurrentSet => _wonLegsCurrentSet;
  int get pointsLeft => _pointsLeft;
  List<String> get finishRecommendation => Finishes.get(_pointsLeft);
  int get lastPoints => _lastPoints;
  int get dartsThrownCurrentLeg => _dartsThrownCurrentLeg;
  Stats get stats => _stats;

  final List<Set> sets;

  Player(this._game, this.id)
       : sets = [];

  ///
  /// PRIVATE
  ///

  /// computed properties for interface
  bool get _isCurrentTurn => _game._currentTurn == this;

  bool get _won {
    int setsNeededToWin = _game._config.type == Type.legs
        ? 1
        : _game._config.mode == Mode.firstTo
            ? _game._config.size
            : (_game._config.size / 2).round();

    return setsNeededToWin == _wonSets;
  }

  int get _wonSets {
    int wonSets = 0;
    for (Set set in sets) {
      if (set._won) {
        wonSets++;
      }
    }
    return wonSets;
  }

  int get _wonLegsCurrentSet => _currentSet?._wonLegs;

  int get _pointsLeft => _currentSet?._currentLeg?._pointsLeft;

  int get _lastPoints {
    if (_currentSet?._lastPoints != null) {
      return _currentSet?._lastPoints;
    } else {
      if (_prevSet != null) {
        return _prevSet?._lastPoints;
      }
    }
    return null;
  }

  int get _dartsThrownCurrentLeg => _currentSet?._currentLeg?._dartsThrown;

  Stats get _stats => Stats(
      average: _average,
      checkoutPercentage: _checkoutPercentage,
      firstNineAverage: _firstNineAverage,
      bestLegDartsThrown: _bestLegDartsThrown,
      bestLegAverage: _bestLegAverage,
      worstLegDartsThrown: _worstLegDarts,
      worstLegAverage: _worstLegAverage,
      averageDartsPerLeg: _averageDartsPerLeg,
      highestFinish: _highestFinish,
      fourtyPlus: _fourtyPlus,
      sixtyPlus: _sixtyPlus,
      eightyPlus: _eightyPlus,
      hundredPlus: _hundredPlus,
      hundredTwentyPlus: _hundredTwentyPlus,
      hundredFourtyPlus: _hundredFourtyPlus,
      hundredSixtyPlus: _hundredSixtyPlus,
      hundredEighty: _hundredEighty);

  double get _average => _dartsThrown == 0 ? 0 : (3 * _points) / _dartsThrown;

  double get _checkoutPercentage =>
      _dartsOnDouble == 0 ? 0 : _wonLegs / _dartsOnDouble;

  double get _firstNineAverage {
    int points = 0;
    int dartsThrown = 0;
    for (Set set in sets) {
      for (Leg leg in set.legs) {
        int index = 0;
        for (Throw t in leg.throws) {
          points += t.points;
          dartsThrown += t.dartsThrown;
          index++;
          if (index == 3) break;
        }
      }
    }
    if (dartsThrown == 0) return 0;
    return (3 * points) / dartsThrown;
  }

  int get _bestLegDartsThrown {
    List<int> dartsThrown = [];
    for (Set set in sets) {
      for (Leg leg in set.legs) {
        if (leg.won) {
          dartsThrown.add(leg._dartsThrown);
        }
      }
    }

    if (dartsThrown.isEmpty) return null;
    return dartsThrown.reduce(min);
  }

  double get _bestLegAverage {
    List<double> averages = [];
    for (Set set in sets) {
      for (Leg leg in set.legs) {
        if (leg.won) {
          averages.add(leg._average);
        }
      }
    }

    if (averages.isEmpty) return null;
    return averages.reduce(max);
  }

  int get _worstLegDarts {
    List<int> dartsThrown = [];
    for (Set set in sets) {
      for (Leg leg in set.legs) {
        if (leg.won) {
          dartsThrown.add(leg._dartsThrown);
        }
      }
    }

    if (dartsThrown.isEmpty) return null;
    return dartsThrown.reduce(max);
  }

  double get _worstLegAverage {
    List<double> averages = [];
    for (Set set in sets) {
      for (Leg leg in set.legs) {
        if (leg.won) {
          averages.add(leg._average);
        }
      }
    }

    if (averages.isEmpty) return null;
    return averages.reduce(min);
  }

  double get _averageDartsPerLeg {
    int dartsThrownInWonLegs = 0;
    for (Set set in sets) {
      for (Leg leg in set.legs) {
        if (leg.won) {
          dartsThrownInWonLegs += leg._dartsThrown;
        }
      }
    }

    if (dartsThrownInWonLegs == 0) return null;
    return dartsThrownInWonLegs / _wonLegs;
  }

  int get _highestFinish {
    List<int> nonNullFinishes = List.from(_finishes);
    nonNullFinishes.removeWhere((element) => element == null);
    if (nonNullFinishes.isEmpty) return null;
    return nonNullFinishes.reduce(max);
  }

  int get _fourtyPlus {
    int fourtyPlus = 0;
    for (Set set in sets) {
      fourtyPlus += set._fourtyPlus;
    }
    return fourtyPlus;
  }

  int get _sixtyPlus {
    int sixtyPlus = 0;
    for (Set set in sets) {
      sixtyPlus += set._sixtyPlus;
    }
    return sixtyPlus;
  }

  int get _eightyPlus {
    int eightyPlus = 0;
    for (Set set in sets) {
      eightyPlus += set._eightyPlus;
    }
    return eightyPlus;
  }

  int get _hundredPlus {
    int hundredPlus = 0;
    for (Set set in sets) {
      hundredPlus += set._hundredPlus;
    }
    return hundredPlus;
  }

  int get _hundredTwentyPlus {
    int hundredTwentyPlus = 0;
    for (Set set in sets) {
      hundredTwentyPlus += set._hundredTwentyPlus;
    }
    return hundredTwentyPlus;
  }

  int get _hundredFourtyPlus {
    int hundredFourtyPlus = 0;
    for (Set set in sets) {
      hundredFourtyPlus += set._hundredFourtyPlus;
    }
    return hundredFourtyPlus;
  }

  int get _hundredSixtyPlus {
    int hundredSixtyPlus = 0;
    for (Set set in sets) {
      hundredSixtyPlus += set._hundredSixtyPlus;
    }
    return hundredSixtyPlus;
  }

  int get _hundredEighty {
    int hundredEighty = 0;
    for (Set set in sets) {
      hundredEighty += set._hundredEighty;
    }
    return hundredEighty;
  }

  /// internal properties
  final Game _game;

  Set get _currentSet => sets.length > 0 ? sets.last : null;

  Set get _prevSet {
    if (sets.length > 1) {
      return sets[sets.length - 2];
    } else {
      return null;
    }
  }

  Leg get _prevLeg {
    if (_currentSet._prevLeg != null) {
      return _currentSet._prevLeg;
    } else {
      if (_prevSet != null) {
        return _prevSet.legs.last;
      }
    }
    return null;
  }

  int get _wonLegs {
    int wonLegs = 0;
    for (Set set in sets) {
      wonLegs += set._wonLegs;
    }
    return wonLegs;
  }

  int get _legs {
    int legs = 0;
    for (Set set in sets) {
      legs += set.legs.length;
    }
    return legs;
  }

  int get _points {
    int points = 0;
    for (Set set in sets) {
      points += set._points;
    }
    return points;
  }

  int get _dartsThrown {
    int dartsThrown = 0;
    for (Set set in sets) {
      dartsThrown += set._dartsThrown;
    }
    return dartsThrown;
  }

  int get _dartsOnDouble {
    int dartsOnDouble = 0;
    for (Set set in sets) {
      dartsOnDouble += set._dartsOnDouble;
    }
    return dartsOnDouble;
  }

  List<int> get _finishes {
    List<int> finishes = [];
    for (Set set in sets) {
      finishes += set._finishes;
    }
    return finishes;
  }

  /// internal methods
  void _createSet() {
    sets.add(Set(
        _game._config.startingPoints,
        _game._config.type == Type.sets
            ? 3
            : _game._config.mode == Mode.firstTo
                ? _game._config.size
                : (_game._config.size / 2).round()));
  }

  void _removeSet() {
    sets.removeLast();
  }

  @override
  String toString() {
    return 'Player{id: $id, name: $name, isCurrentTurn: $isCurrentTurn, won: $won, wonSets: $wonSets, wonLegsCurrentSet: $wonLegsCurrentSet, pointsLeft: $pointsLeft, lastPoints: $lastPoints, dartsThrownCurrentLeg: $dartsThrownCurrentLeg, stats: $stats, sets: $sets}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Player && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
