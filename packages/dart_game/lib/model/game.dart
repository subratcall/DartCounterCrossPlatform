part of dart_game;

class Game {
  /// INTERFACE
  Status get status => _status;
  final Config config;
  List<Player> get players => _players;
  List<Set> get sets => _sets;

  bool get hasDartBot => _dartBotIndex != -1;
  DartBot get dartBot => hasDartBot ? players[_dartBotIndex] : null;
  bool get hasWinner => winner != null;
  Player get winner {
    switch (config.type) {
      case Type.legs:
        int legsNeededToWin;
        switch (config.mode) {
          case Mode.firstTo:
            legsNeededToWin = config.size;
            for (Player player in _players) {
              if (player.legs == legsNeededToWin) {
                return player;
              }
            }
            break;
          case Mode.bestOf:
            legsNeededToWin = (config.size / 2).round();
            for (Player player in _players) {
              if (player.legs == legsNeededToWin) {
                return player;
              }
            }
            break;
        }
        break;
      case Type.sets:
        int setsNeededToWin;
        switch (config.mode) {
          case Mode.firstTo:
            setsNeededToWin = config.size;
            for (Player player in _players) {
              if (player.sets == setsNeededToWin) {
                return player;
              }
            }
            break;
          case Mode.bestOf:
            setsNeededToWin = (config.size / 2).round();
            for (Player player in _players) {
              if (player.sets == setsNeededToWin) {
                return player;
              }
            }
            break;
        }
        break;
    }
    return null;
  }

  Game()
      : _status = Status.pending,
        config = Config(),
        _players = [Player()],
        _sets = [];

  bool addPlayer(Player player) {
    if (_players.length < 4) {
      _players.add(player);
      return true;
    }
    return false;
  }

  void removePlayer(String id) {
    _players.removeWhere((player) => player.id == id);
  }

  bool addDartBot() {
    if (!hasDartBot) {
      _players.add(DartBot());
      return true;
    }
    return false;
  }

  void removeDartBot() {
    if (hasDartBot) {
      _players.removeAt(_dartBotIndex);
    }
  }

  void start() {
    _createSet();
    _createLeg();
    _initPlayers();
    _status = Status.running;
  }

  bool performThrow(Throw t) {
    if (true) {
      // TODO THROW VALIDATION
      _currentTurn.isCurrentTurn = false;

      // sets the player who threw
      t.playerIndex = _turnIndex;

      // updates the leg data
      _currentLeg.performThrow(t);

      // updates the player data
      _currentTurn.lastThrow = t.points;
      _currentTurn.pointsLeft -= t.points;
      _currentTurn.dartsThrown += t.dartsThrown;
      _currentTurn.average = _averageCurrentTurn;
      _currentTurn.checkoutPercentage = _checkoutPercentageCurrentTurn;

      // updates the reference to the Player who has next turn
      // updates the player data and creates next leg and set when needed
      if (_currentLeg.winner != -1) {
        if (_currentSet.winner != -1) {
          int sets = -1;
          if (config.type == Type.sets) {
            sets = _currentTurn.sets + 1;
          }
          int legs;
          if (config.type == Type.legs) {
            legs = _currentTurn.legs + 1;
          } else {
            legs = 0;
          }

          _currentTurn.pointsLeft = 0;
          _currentTurn.sets = sets;
          _currentTurn.legs = legs;
          if (winner != null) {
            // GAME FINISHED
            _status = Status.finished;
          } else {
            // CONTINUE NEW SET
            for (int i = 0; i < _players.length; i++) {
              Player player = _players[i];
              player.pointsLeft = config.startingPoints;
              player.dartsThrown = 0;
              player.legs = 0;
            }
            _turnIndex = (_currentSet.startIndex + 1) % _players.length;
            _createSet();
            _createLeg();
          }
        } else {
          // CONTINUE NEW LEG
          for (int i = 0; i < _players.length; i++) {
            Player player = _players[i];
            int legs = player.legs;
            if (i == _turnIndex) {
              legs += 1;
            }
            player.pointsLeft = config.startingPoints;
            player.dartsThrown = 0;
            player.legs = legs;
          }
          _turnIndex = (_currentLeg.startIndex + 1) % _players.length;
          _createLeg();
        }
      } else {
        // CONTINUE
        _turnIndex = (_turnIndex + 1) % _players.length;
      }

      _currentTurn.isCurrentTurn = true;

      if (_currentTurn is DartBot && _currentLeg.winner == -1) {
        performDartBotThrow();
      }
      return true;
    }
    return false;
  }

  void performDartBotThrow() {
    int randomScore = ScoreGenerator.getScore(_currentTurn as DartBot);
    Throw t;

    if (randomScore == _currentTurn.pointsLeft) {
      if (ThrowValidator.isValidThrowWithOneDartThrown(randomScore, _currentTurn.pointsLeft)) {
        t = new Throw(randomScore, 1, 1);
      } else if (ThrowValidator.isValidThrowWithThreeDartsThrown(randomScore, _currentTurn.pointsLeft)) {
        t = new Throw(randomScore, 3, 1);
      } else {
        t = new Throw(randomScore, 2, 1);
      }
    } else {
      t = new Throw(randomScore);
    }
    performThrow(t);
  }

  void undoThrow() {
    if (_sets.length == 1 && _sets[0].legs.length == 1 && _currentLeg.throws.length == 0) {
      // NO THROW PERFORMED YET -> do nothing
      return;
    }

    _currentTurn.isCurrentTurn = false;

    if (_sets.length == 1 && _sets[0].legs.length == 1 && _currentLeg.throws.length == 1) {
      // UNDO FIRST THROW OF GAME
      Throw last = _currentLeg.undoThrow();
      _turnIndex = last.playerIndex;
      _currentTurn.lastThrow = -1;
      _currentTurn.pointsLeft = config.startingPoints;
      _currentTurn.dartsThrown = 0;
      _currentTurn.average = 0;
      _currentTurn.checkoutPercentage = 0;
    } else if (_sets.length >= 2 && _currentSet.legs.length == 1 && _currentLeg.throws.length == 0) {
      // UNDO LAST THROW OF SET
      _sets.removeLast();
      Throw last = _currentLeg.undoThrow();
      _turnIndex = last.playerIndex;

      // restore player data
      for (int i = 0; i < _players.length; i++) {
        Player player = _players[i];

        if (_turnIndex == i) {
          player.lastThrow = _currentLeg.throws[_currentLeg.throws.length - _players.length].points;
          player.average = _averageCurrentTurn;
          player.checkoutPercentage = _checkoutPercentageCurrentTurn;
        }

        player.pointsLeft = _currentLeg.pointsLeft[i];
        player.dartsThrown = _currentLeg.dartsThrown[i];

        int s = 0;
        int l = 0;
        for (Set set in _sets) {
          if (config.type == Type.sets) {
            if (set.winner == i) {
              s += 1;
            }
          } else {
            s = -1;
          }
        }

        for (Leg leg in _currentSet.legs) {
          if (leg.winner == i) {
            l += 1;
          }
        }

        player.sets = s;
        player.legs = l;
      }
    } else if (_currentSet.legs.length >= 2 && _currentLeg.throws.length == 0) {
      // UNDO LAST THROW OF LEG
      _currentSet.legs.removeLast();
      Throw last = _currentLeg.undoThrow();
      _turnIndex = last.playerIndex;

      // restore player data
      for (int i = 0; i < _players.length; i++) {
        Player player = _players[i];

        if (_turnIndex == i) {
          player.lastThrow = _currentLeg.throws[_currentLeg.throws.length - _players.length].points;
          player.average = _averageCurrentTurn;
          player.checkoutPercentage = _checkoutPercentageCurrentTurn;
        }

        player.pointsLeft = _currentLeg.pointsLeft[i];
        player.dartsThrown = _currentLeg.dartsThrown[i];

        int l = 0;
        for (Leg leg in _currentSet.legs) {
          if (leg.winner == i) {
            l += 1;
          }
        }

        player.legs = l;
      }
    } else {
      // UNDO STANDARD THROW
      Throw last = _currentLeg.undoThrow();
      _turnIndex = last.playerIndex;
      // TODO index is buged
      _currentTurn.lastThrow = _currentLeg.throws[_currentLeg.throws.length + 1 - _players.length].points;
      _currentTurn.pointsLeft += last.points;
      _currentTurn.dartsThrown -= last.dartsThrown;
    }

    _currentTurn.isCurrentTurn = true;
    _currentTurn.average = _averageCurrentTurn;
    _currentTurn.checkoutPercentage = _checkoutPercentageCurrentTurn;
  }

  /// INTERNAL
  Status _status;
  List<Player> _players;
  List<Set> _sets;
  int _turnIndex;
  int get _dartBotIndex {
    return players.indexWhere((player) => player is DartBot);
  }

  Set get _currentSet {
    return _sets.last;
  }

  Leg get _currentLeg {
    return _currentSet.legs.last;
  }

  Player get _currentTurn {
    return _players[_turnIndex];
  }

  double get _averageCurrentTurn {
    int totalDartsThrown = 0;
    int totalPointsScored = 0;
    for (Set set in _sets) {
      for (Leg leg in set.legs) {
        totalDartsThrown += leg.dartsThrown[_turnIndex];
        totalPointsScored += (config.startingPoints - leg.pointsLeft[_turnIndex]);
      }
    }
    if (totalDartsThrown == 0) {
      return 0;
    }
    return ((3 * totalPointsScored) / totalDartsThrown);
  }

  double get _checkoutPercentageCurrentTurn {
    int totalLegsWon = 0;
    int totalDartsOnDouble = 0;
    for (Set set in _sets) {
      for (Leg leg in set.legs) {
        if (leg.winner == _turnIndex) {
          totalLegsWon += 1;
        }
        totalDartsOnDouble += leg.dartsOnDouble[_turnIndex];
      }
    }

    if (totalDartsOnDouble == 0) {
      return 0;
    }
    return ((totalLegsWon / totalDartsOnDouble) * 100);
  }

  void _createSet() {
    if (config.mode == Mode.firstTo) {
      if (config.type == Type.legs) {
        _sets.add(Set(_turnIndex, config.size));
      } else {
        _sets.add(Set(_turnIndex, 3));
      }
    } else {
      if (config.type == Type.legs) {
        _sets.add(Set(_turnIndex, (config.size / 2).round()));
      } else {
        _sets.add(Set(_turnIndex, 3));
      }
    }
  }

  void _createLeg() {
    _currentSet.legs.add(Leg(_turnIndex, _players.length, config.startingPoints));
  }

  void _initPlayers() {
    int index = 1;
    for (Player player in _players) {
      if (player.name == '') {
        player.name = 'Player $index}';
        index++;
      }
      player.isCurrentTurn = false;
      player.lastThrow = -1;
      player.pointsLeft = config.startingPoints;
      player.dartsThrown = 0;
      player.sets = config.type == Type.sets ? 0 : -1;
      player.legs = 0;
      player.average = 0;
      player.checkoutPercentage = 0;
    }
    _currentTurn.isCurrentTurn = true;
  }

  @override
  String toString() {
    return 'Game{config: $config, status: $_status, players: $_players, sets: $_sets, turnIndex: $_turnIndex}';
  }

  @override
  bool operator ==(other) {
    Game o = other;
    return config == o.config &&
        listEquals(_players, o._players) &&
        listEquals(_sets, o._sets) &&
        _turnIndex == o._turnIndex;
  }
}
