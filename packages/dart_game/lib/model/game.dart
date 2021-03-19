part of dart_game;

class Game {

  Config config;
  Status status;

  List<Player> players;
  List<Set> sets;

  int _turnIndex;

  Game() {
    this.config = Config();
    this.status = Status.pending;
    this.players = [];
    this.sets = [];
    this._turnIndex = 0;
    addPlayer(Player());
  }

  bool addPlayer(Player player) {
    if (players.length < 4) {
      players.add(player);
      return true;
    }
    return false;
  }

  void removePlayer(int index) {
    players.removeAt(index);
  }

  bool addDartBot() {
    if (dartBotIndex == -1) {
      players.add(new DartBot(20));
      return true;
    }
    return false;
  }

  void removeDartBot() {
    if (dartBotIndex != -1) {
      this.players.removeAt(dartBotIndex);
    }
  }

  void start() {
    _createSet();
    _createLeg();
    _initPlayers();
    status = Status.running;
  }

  bool performThrow(Throw t) {
    if (true) {
      // TODO THROW VALIDATION
      _currentTurn.isNext = false;

      // sets the player who threw
      t.playerIndex = _turnIndex;

      // updates the leg data
      _currentLeg.performThrow(t);

      // updates the player data
      _currentTurn.lastThrow = t.points;
      _currentTurn.pointsLeft -= t.points;
      _currentTurn.dartsThrown += t.dartsThrown;
      _currentTurn.average = this._averageCurrentTurn;
      _currentTurn.checkoutPercentage = this._checkoutPercentageCurrentTurn;

      // updates the reference to the Player who has next turn
      // updates the player data and creates next leg and set when needed
      if (_currentLeg.winner != -1) {
        if (_currentSet.winner != -1) {
          int sets = -1;
          if (this.config.type == Type.sets) {
            sets = _currentTurn.sets + 1;
          }
          int legs;
          if (this.config.type == Type.legs) {
            legs = _currentTurn.legs + 1;
          } else {
            legs = 0;
          }

          _currentTurn.pointsLeft = 0;
          _currentTurn.sets = sets;
          _currentTurn.legs = legs;
          if (this.winner != null) {
            // GAME FINISHED
            this.status = Status.finished;
          } else {
            // CONTINUE NEW SET
            for (int i = 0; i < this.players.length; i++) {
              Player player = players[i];
              player.pointsLeft = this.config.startingPoints;
              player.dartsThrown = 0;
              player.legs = 0;
            }
            this._turnIndex = (_currentSet.startIndex + 1) % this.players.length;
            _createSet();
            _createLeg();
          }
        } else {
          // CONTINUE NEW LEG
          for (int i = 0; i < this.players.length; i++) {
            Player player = players[i];
            int legs = player.legs;
            if (i == this._turnIndex) {
              legs += 1;
            }
            player.pointsLeft = this.config.startingPoints;
            player.dartsThrown = 0;
            player.legs = legs;
          }
          this._turnIndex = (_currentLeg.startIndex + 1) % this.players.length;
          _createLeg();
        }
      } else {
        // CONTINUE
        this._turnIndex = (this._turnIndex + 1) % this.players.length;
      }

      _currentTurn.isNext = true;

      if (_currentTurn is DartBot && _currentLeg.winner == -1) {
        performDartBotThrow();
      }
      return true;
    }
    return false;
  }

  // TODO test
  void performDartBotThrow() {
    int randomScore = ScoreGenerator.getScore(_currentTurn as DartBot);
    Throw t;

    if (randomScore == _currentTurn.pointsLeft) {
      if (ThrowValidator.isValidThrowWithOneDartThrown(randomScore, _currentTurn.pointsLeft)) {
        t = new Throw(randomScore, 1, 1);
      } else if (ThrowValidator.isValidThrowWithThreeDartsThrown(randomScore, _currentTurn.pointsLeft)) {
        t = new Throw(randomScore, 1, 3);
      } else {
        t = new Throw(randomScore, 1, 2);
      }
    } else {
      t = new Throw(randomScore);
    }
    performThrow(t);
  }

  void undoThrow() {
    if (sets.length == 1 &&
        sets[0].legs.length == 1 &&
        _currentLeg.throws.length == 0) {
      // NO THROW PERFORMED YET -> do nothing
      return;
    }

    _currentTurn.isNext = false;

    if (sets.length == 1 &&
        sets[0].legs.length == 1 &&
        _currentLeg.throws.length == 1) {
      // UNDO FIRST THROW OF GAME
      Throw last = _currentLeg.undoThrow();
      this._turnIndex = last.playerIndex;
      _currentTurn.lastThrow = -1;
      _currentTurn.pointsLeft = this.config.startingPoints;
      _currentTurn.dartsThrown = 0;
      _currentTurn.average = "0.00";
      _currentTurn.checkoutPercentage = "0.00";
    } else if (this.sets.length >= 2 &&
        _currentSet.legs.length == 1 &&
        _currentLeg.throws.length == 0) {
      // UNDO LAST THROW OF SET
      this.sets.removeLast();
      Throw last = _currentLeg.undoThrow();
      this._turnIndex = last.playerIndex;

      // restore player data
      for (int i = 0; i < this.players.length; i++) {
        Player player = this.players[i];

        if (this._turnIndex == i) {
          player.lastThrow = _currentLeg
              .throws[_currentLeg.throws.length - this.players.length].points;
          player.average = _averageCurrentTurn;
          player.checkoutPercentage = _checkoutPercentageCurrentTurn;
        }

        player.pointsLeft = _currentLeg.pointsLeft[i];
        player.dartsThrown = _currentLeg.dartsThrown[i];

        int s = 0;
        int l = 0;
        for (Set set in this.sets) {
          if (this.config.type == Type.sets) {
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
      this._turnIndex = last.playerIndex;

      // restore player data
      for (int i = 0; i < this.players.length; i++) {
        Player player = this.players[i];

        if (this._turnIndex == i) {
          player.lastThrow = _currentLeg
              .throws[_currentLeg.throws.length - this.players.length].points;
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
      this._turnIndex = last.playerIndex;
      _currentTurn.lastThrow = _currentLeg
          .throws[_currentLeg.throws.length + 1 - this.players.length].points;
      _currentTurn.pointsLeft += last.points;
      _currentTurn.dartsThrown -= last.dartsThrown;
    }

    _currentTurn.isNext = true;
    _currentTurn.average = _averageCurrentTurn;
    _currentTurn.checkoutPercentage = _checkoutPercentageCurrentTurn;
  }

  String get description {
    return config.mode
            .toString()
            .replaceAll("GameMode.", " ")
            .replaceAll("_", " ") +
        " " +
        config.size.toString() +
        " " +
        config.type.toString().replaceAll("GameType.", " ");
  }

  int get dartBotIndex {
    for (int i = 0; i < this.players.length; i++) {
      Player player = this.players[i];
      if (player is DartBot) {
        return i;
      }
    }
    return -1;
  }

  Player get winner {
    switch (this.config.type) {
      case Type.legs:
        int legsNeededToWin;
        switch (this.config.mode) {
          case Mode.firstTo:
            legsNeededToWin = this.config.size;
            for (Player player in this.players) {
              if (player.legs == legsNeededToWin) {
                return player;
              }
            }
            break;
          case Mode.bestOf:
            legsNeededToWin = (this.config.size / 2).round();
            for (Player player in this.players) {
              if (player.legs == legsNeededToWin) {
                return player;
              }
            }
            break;
        }
        break;
      case Type.sets:
        int setsNeededToWin;
        switch (this.config.mode) {
          case Mode.firstTo:
            setsNeededToWin = this.config.size;
            for (Player player in this.players) {
              if (player.sets == setsNeededToWin) {
                return player;
              }
            }
            break;
          case Mode.bestOf:
            setsNeededToWin = (this.config.size / 2).round();
            for (Player player in this.players) {
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

  Set get _currentSet {
    return this.sets.last;
  }

  Leg get _currentLeg {
    return this._currentSet.legs.last;
  }

  Player get _currentTurn {
    return this.players[_turnIndex];
  }

  String get _averageCurrentTurn {
    int totalDartsThrown = 0;
    int totalPointsScored = 0;
    for (Set set in this.sets) {
      for (Leg leg in set.legs) {
        totalDartsThrown += leg.dartsThrown[_turnIndex];
        totalPointsScored +=
            (this.config.startingPoints - leg.pointsLeft[_turnIndex]);
      }
    }
    if (totalDartsThrown == 0) {
      return "0.00";
    }
    return ((3 * totalPointsScored) / totalDartsThrown).toStringAsFixed(2);
  }

  String get _checkoutPercentageCurrentTurn {
    int totalLegsWon = 0;
    int totalDartsOnDouble = 0;
    for (Set set in this.sets) {
      for (Leg leg in set.legs) {
        if (leg.winner == this._turnIndex) {
          totalLegsWon += 1;
        }
        totalDartsOnDouble += leg.dartsOnDouble[_turnIndex];
      }
    }

    if (totalDartsOnDouble == 0) {
      return "0.00";
    }
    return ((totalLegsWon / totalDartsOnDouble) * 100).toStringAsFixed(2);
  }

  void _createSet() {
    if (this.config.mode == Mode.firstTo) {
      if (this.config.type == Type.legs) {
        this.sets.add(new Set(_turnIndex, this.config.size));
      } else {
        this.sets.add(new Set(_turnIndex, 3));
      }
    } else {
      if (config.type == Type.legs) {
        this.sets.add(new Set(_turnIndex, (this.config.size / 2).round()));
      } else {
        this.sets.add(new Set(_turnIndex, 3));
      }
    }
  }

  void _createLeg() {
    this._currentSet.legs.add(new Leg(
        this._turnIndex, this.players.length, this.config.startingPoints));
  }

  void _initPlayers() {
    int index = 1;
    for (Player player in this.players) {
      if (player.name == "") {
        player.name = "Player ${index}";
        index++;
      }
      player.isNext = false;
      player.lastThrow = -1;
      player.pointsLeft = this.config.startingPoints;
      player.dartsThrown = 0;
      if (this.config.type == Type.sets) {
        player.sets = 0;
      } else {
        player.sets = -1;
      }
      player.legs = 0;
      player.average = "0.00";
      player.checkoutPercentage = "0.00";
    }
    this.players[_turnIndex].isNext = true;
  }

  @override
  String toString() {
    return 'Game{config: $config, status: $status, players: $players, sets: $sets, turnIndex: $_turnIndex}';
  }

  @override
  bool operator ==(other) {
    Game o = other as Game;
    return this.config == o.config &&
        listEquals(this.players, o.players) &&
        listEquals(this.sets, o.sets) &&
        this._turnIndex == o._turnIndex;
  }
}
