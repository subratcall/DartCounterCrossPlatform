import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/services/playing/offline/playing_offline_service.dart';
import 'package:dart_counter/services/playing/online/playing_online_service.dart';
import 'package:dart_counter/services/playing/service.dart';
import 'package:dart_game/dart_game.dart' as DartGame;

class PlayingService extends AbstractPlayingService {
  final PlayingOfflineService _playingOfflineService = PlayingOfflineService.instance;
  final PlayingOnlineService _playingOnlineService = PlayingOnlineService.instance;

  bool _online = false;

  Game gameSnapshot;

  PlayingService() {
    onEvent().listen((event) {
      if(event is SnapshotEvent) {
        gameSnapshot = event.item as Game;
      }
    });
  }

  @override
  Stream<Event> onEvent() {
    return _online ? _playingOnlineService.onEvent() : _playingOfflineService.onEvent();
  }

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

  void joinGame(String gameId) {
    if (online) {
      _playingOnlineService.joinGame(gameId);
    }
  }

  void addDartBot() {
    _playingOfflineService.addDartBot();
  }

  void removeDartBot() {
    _playingOfflineService.removeDartBot();
  }

  void setDartBotAverage(int average) {
    if(!online) {
      _playingOfflineService.setDartBotTargetAverage(average);
    }
  }

  bool addPlayer() {
    if (online) {
      _playingOnlineService.addPlayer();
    } else {
      _playingOfflineService.addPlayer();
    }
  }

  void removePlayer(int id) {
    if (online) {
      //_playingOnlineService.removePlayer(id);
    } else {
      _playingOfflineService.removePlayer(id);
    }
  }

  void setStartingPoints(int startingPoints) {
    if (online) {
      _playingOnlineService.setStartingPoints(startingPoints);
    } else {
      _playingOfflineService.setStartingPoints(startingPoints);
    }
  }

  void setMode(Mode mode) {
    if (online) {
      // TODO
    } else {
      _playingOfflineService.setMode(mode);
    }
  }

  void setSize(int size) {
    if (online) {
      _playingOnlineService.setSize(size);
    } else {
      _playingOfflineService.setSize(size);
    }
  }

  void setType(Type type) {
    if (online) {
      // TODO
    } else {
      _playingOfflineService.setType(type);
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
  
  /// HELPER
  bool validatePoints(int points, int pointsLeft) {
    return DartGame.ThrowValidator.validatePoints(points, pointsLeft);
  }
}
