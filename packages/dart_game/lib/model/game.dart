part of dart_game;

class Game {
  ///
  /// PUBLIC
  ///

  Status get status => _status;
  Config get config => _config;

  List<Player> get players => _players;

  Game() {
    _config = Config();
    _status = Status.pending;
    _players = [];
    _turnIndex = 0;
    _startSetIndex = 0;
    _startLegIndex = 0;
    addPlayer();
  }

  bool addPlayer() {
    if (status == Status.pending) {
      if (_players.length < 4) {
        _players.add(Player(this));

        return true;
      }
    }
    return false;
  }

  void removePlayer(int id) {
    if (status == Status.pending) {
      if (_players.length > 1 && !_hasDartBot ||
          _players.length > 2 && _hasDartBot) {
        _players.removeWhere((player) => player.id == id);
      }
    }
  }

  bool addDartBot() {
    if (status == Status.pending) {
      if (!_hasDartBot && players.length < 4) {
        _players.add(DartBot(this));
        return true;
      }
    }
    return false;
  }

  void setDartBotTargetAverage(int targetAverage) {
    if (status == Status.pending) {
      if (_hasDartBot) {
        (_players[_dartBotIndex] as DartBot).targetAverage = targetAverage;
      }
    }
  }

  void removeDartBot() {
    if (status == Status.pending) {
      if (_hasDartBot) {
        _players.removeAt(_dartBotIndex);
      }
    }
  }

  void setStartingPoints(int startingPoints) {
    if (status == Status.pending) {
      _config.startingPoints = startingPoints;
    }
  }

  void setMode(Mode mode) {
    if (status == Status.pending) {
      _config.mode = mode;
    }
  }

  void setSize(int size) {
    if (size < 1) throw ArgumentError.value(size, 'size can not be < 1');
    if (status == Status.pending) {
      _config.size = size;
    }
  }

  void setType(Type type) {
    if (status == Status.pending) {
      _config.type = type;
    }
  }

  void start() {
    if (_status == Status.pending) {
      _status = Status.running;
      for (Player player in _players) {
        player._createSet();
      }
    }
  }

  void performThrow(Throw t) {
    if (_status == Status.running) {
      if (ThrowValidator.validateThrow(t, _currentTurn.pointsLeft)) {
        _currentTurn._currentSet._currentLeg.throws.add(t);
        if (_currentTurn._won) {
          _status = Status.finished;
        } else {
          _nextTurn();
          if (_turnIndex == _dartBotIndex) {
            performThrow(
                ThrowGenerator.generate(_players[_dartBotIndex], this));
          }
        }
      }
    }
  }

  void undoThrow() {
    if (_status == Status.running) {
      if (_noThrowsPerformedGame) {
        // no throws performed in game => do nothing
        return;
      } else if (_noThrowsPerformedSet) {
        // no throws performed in set => remove set update turnIndex remove throw
        for (Player player in _players) {
          player._removeSet();
        }
        _startSetIndex = (_startSetIndex - 1) % _players.length;
        _startLegIndex =
            (_startSetIndex + _currentTurn._currentSet.legs.length - 1) %
                _players.length;
        for (int i = 0; i < _players.length; i++) {
          if (_players[i]._currentSet._currentLeg._won) {
            _turnIndex = i;
            break;
          }
        }
        _currentTurn._currentSet._currentLeg.throws.removeLast();
      } else if (_noThrowsPerformedLeg) {
        // no throws performed in leg => update turnIndex remove throw
        for (Player player in _players) {
          player._currentSet._removeLeg();
        }
        _startLegIndex =
            (_startSetIndex + _currentTurn._currentSet.legs.length - 1) %
                _players.length;
        for (int i = 0; i < _players.length; i++) {
          if (_players[i]._currentSet._currentLeg._won) {
            _turnIndex = i;
            break;
          }
        }
        _currentTurn._currentSet._currentLeg.throws.removeLast();
      } else {
        // normal throw => update turnIndex remove throw
        _turnIndex = (_turnIndex - 1) % _players.length;
        _currentTurn._currentSet._currentLeg.throws.removeLast();
      }
    }
  }

  ///
  /// PRIVATE
  ///

  Status _status;
  Config _config;
  List<Player> _players;
  int _turnIndex;
  int _startSetIndex;
  int _startLegIndex;
  int get _dartBotIndex => players.indexWhere((player) => player is DartBot);
  bool get _hasDartBot => _dartBotIndex != -1;
  Player get _currentTurn => players[_turnIndex];

  bool get _noThrowsPerformedGame {
    bool allSetsEqual1 = true;
    bool allLegsEqual1 = true;
    bool allThrowsEqual0 = true;

    for (Player player in _players) {
      allSetsEqual1 &= player.sets.length == 1;
      allLegsEqual1 &= player._currentSet.legs.length == 1;
      allThrowsEqual0 &= player._currentSet._currentLeg.throws.length == 0;
    }

    return allSetsEqual1 && allLegsEqual1 && allThrowsEqual0;
  }

  bool get _noThrowsPerformedSet {
    bool allLegsEqual1 = true;
    bool allThrowsEqual0 = true;

    for (Player player in _players) {
      allLegsEqual1 &= player._currentSet.legs.length == 1;
      allThrowsEqual0 &= player._currentSet._currentLeg.throws.length == 0;
    }

    return allLegsEqual1 && allThrowsEqual0;
  }

  bool get _noThrowsPerformedLeg {
    bool allThrowsEqual0 = true;

    for (Player player in _players) {
      allThrowsEqual0 &= player._currentSet._currentLeg.throws.length == 0;
    }

    return allThrowsEqual0;
  }

  void _nextTurn() {
    // create new legs, sets if needed
    Set setThrowWasPerformedOn = _currentTurn._currentSet;
    Leg legThrowWasPerformedOn = setThrowWasPerformedOn._currentLeg;
    for (Player player in _players) {
      if (setThrowWasPerformedOn._won) {
        // won set
        player._createSet();
      } else if (legThrowWasPerformedOn._won) {
        // won leg
        player._currentSet._createLeg();
      }
    }

    // updated indices
    if (setThrowWasPerformedOn._won) {
      // won set
      _startSetIndex = (_startSetIndex + 1) % _players.length;
      _startLegIndex = _startSetIndex;
      _turnIndex = _startSetIndex;
    } else if (legThrowWasPerformedOn._won) {
      // won leg
      _startLegIndex = (_startLegIndex + 1) % _players.length;
      _turnIndex = _startLegIndex;
    } else {
      // won nothing
      _turnIndex = (_turnIndex + 1) % _players.length;
    }
  }

  void _prevTurn() {
    // update CurrentTurn
    _turnIndex = (_turnIndex - 1) % _players.length;
  }

  @override
  String toString() {
    return 'Game{status: $status, config: $config, players: $players}';
  }
}
