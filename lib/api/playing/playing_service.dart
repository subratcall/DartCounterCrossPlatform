import 'package:dart_counter/api/playing/offline/playing_offline_service.dart';
import 'package:dart_counter/api/playing/online/playing_online_service.dart';
import 'package:dart_counter/model/game.dart';

class PlayingService {
  final PlayingOfflineService _playingOfflineService = PlayingOfflineService.instance;
  final PlayingOnlineService _playingOnlineService = PlayingOnlineService.instance;

  bool _online;

  // TODO remove dummy data;
  final dummyData = [
    Game.dummy(mode: GameMode.FIRST_TO, size: 10, type: GameType.LEGS),
    Game.dummy(mode: GameMode.FIRST_TO, size: 4, type: GameType.SETS),
    Game.dummy(mode: GameMode.BEST_OF, size: 99, type: GameType.LEGS)
  ];

  Stream<Game> get games => Stream.periodic(Duration(seconds: 2), (x) => dummyData[x % dummyData.length]);

  bool get online => _online;

  /// must call this method before a game TODO
  Future<bool> start([bool online = false]) async {
    if (online) {
      _playingOnlineService.connect();
    }
    this._online = online;
  }

  /// call this method after a game TODO
  Future<bool> finish() {
    if (online) {
      _playingOnlineService.disconnect();
    }
  }

  void createGame() {
    if (online) {
      _playingOnlineService.createGame();
    } else {
      _playingOfflineService.createGame();
    }
  }

  void changeGameConfig() {
    if (online) {
      _playingOnlineService.changeGameConfig();
    } else {
      _playingOfflineService.changeGameConfig();
    }
  }

  void joinGame(String gameId) {
    if (online) {
      _playingOnlineService.joinGame(gameId);
    } else {
      _playingOfflineService.joinGame(gameId);
    }
  }

  void toggleMode() {
    if (online) {
      _playingOnlineService.toggleMode();
    } else {
      _playingOfflineService.toggleMode();
    }
  }

  void setSize(int size) {
    if (online) {
      _playingOnlineService.setSize(size);
    } else {
      _playingOfflineService.setSize(size);
    }
  }

  void toggleType() {
    if (online) {
      _playingOnlineService.toggleType();
    } else {
      _playingOfflineService.toggleType();
    }
  }

  void setStartingPoints(int startingPoints) {
    if (online) {
      _playingOnlineService.setStartingPoints(startingPoints);
    } else {
      _playingOfflineService.setStartingPoints(startingPoints);
    }
  }

  bool addPlayer() {
    if (online) {
      _playingOnlineService.addPlayer();
    } else {
      _playingOfflineService.addPlayer();
    }
  }

  void removePlayer(int index) {
    if (online) {
      _playingOnlineService.removePlayer(index);
    } else {
      _playingOfflineService.removePlayer(index);
    }
  }

  void startGame() {
    if (online) {
      _playingOnlineService.startGame();
    } else {
      _playingOfflineService.startGame();
    }
  }

  void performThrow(int points, {int dartsThrown = 3, int dartsOnDouble = 0}) {
    if (online) {
      _playingOnlineService.performThrow(points, dartsThrown, dartsOnDouble);
    } else {
      _playingOfflineService.performThrow(points, dartsThrown, dartsOnDouble);
    }
  }

  void undoThrow() {
    if (online) {
      _playingOnlineService.undoThrow();
    } else {
      _playingOfflineService.undoThrow();
    }
  }
}
