import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/model/leg.dart';
import 'package:dart_counter/model/player.dart';
import 'package:dart_counter/model/set.dart';
import 'package:dart_counter/model/stats.dart';
import 'package:dart_counter/model/throw.dart';
import 'package:dart_counter/services/playing/impl/playing_online_service.dart';
import 'package:dart_game/dart_game.dart' as dartGame;

import 'impl/playing_offline_service.dart';

abstract class PlayingService {

  static PlayingService _instance = PlayingServiceImpl._();

  /// SINGLETON INSTANCE
  static PlayingService get instance {
    if(_instance == null) {
      _instance = PlayingServiceImpl._();
    }
    return _instance;
  }

  /// INTERFACE

}

class PlayingServiceImpl implements PlayingService {
  
  final PlayingOfflineService _playingOfflineService = PlayingOfflineService.instance;
  final PlayingOnlineService _playingOnlineService = PlayingOnlineService.instance;
  
  bool _online = false;

  PlayingServiceImpl._();

  bool get online => _online;

  /// must call this method before a game
  Future<bool> start([bool online = false]) async {
    this._online = online;
    if (_online) {
      await _playingOnlineService.connect();
    }
    return true;
  }

  /// call this method after a game
  Future<bool> finish() async {
    if (online) {
      await _playingOnlineService.disconnect();
    }
    return true;
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
    if (!online) {
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
      _playingOfflineService.setMode(mode == Mode.firstTo ? dartGame.Mode.firstTo : dartGame.Mode.bestOf);
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
      _playingOfflineService.setType(type == Type.legs ? dartGame.Type.legs : dartGame.Type.sets);
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

  void updateName(int id, String newName) {
    if (!online) {
      _playingOfflineService.updateName(id, newName);
    }
  }

  void reorderPlayer(int oldIndex, int newIndex) {
    if (online) {
    } else {
      _playingOfflineService.reorderPlayer(oldIndex, newIndex);
    }
  }

  /// HELPER
  bool validatePoints(int points, int pointsLeft) {
    return dartGame.ThrowValidator.validatePoints(points, pointsLeft);
  }

  Game _parseOfflineGame(dartGame.Game game) {
    Status status = game.status == dartGame.Status.pending
        ? Status.pending
        : game.status == dartGame.Status.running
        ? Status.running
        : Status.pending;
    Mode mode =
    game.config.mode == dartGame.Mode.firstTo ? Mode.firstTo : Mode.bestOf;
    int size = game.config.size;
    Type type = game.config.type == dartGame.Type.legs ? Type.legs : Type.sets;
    int startingPoints = game.config.startingPoints;
    List<Player> players = [];

    Stats parseStats(dartGame.Stats stats) => Stats(
      average: stats.average,
      checkoutPercentage: stats.checkoutPercentage,
      firstNineAverage: stats.firstNineAverage,
      bestLegDartsThrown: stats.bestLegDartsThrown,
      bestLegAverage: stats.bestLegAverage,
      worstLegDartsThrown: stats.worstLegDartsThrown,
      worstLegAverage: stats.worstLegAverage,
      averageDartsPerLeg: stats.averageDartsPerLeg,
      highestFinish: stats.highestFinish,
      fourtyPlus: stats.fourtyPlus,
      sixtyPlus: stats.sixtyPlus,
      eightyPlus: stats.eightyPlus,
      hundredPlus: stats.hundredPlus,
      hundredTwentyPlus: stats.hundredTwentyPlus,
      hundredFourtyPlus: stats.hundredFourtyPlus,
      hundredSixtyPlus: stats.hundredSixtyPlus,
      hundredEighty: stats.hundredEighty,
    );

    Throw parseThrow(dartGame.Throw t) => Throw(
        points: t.points,
        dartsThrown: t.dartsThrown,
        dartsOnDouble: t.dartsOnDouble);

    Leg parseLeg(dartGame.Leg leg) => Leg(throws: leg.throws.map((t) => parseThrow(t)).toList());

    Set parseSet(dartGame.Set set) => Set(
      legs: set.legs.map((leg) => parseLeg(leg)).toList(),
    );

    Player parsePlayer(dartGame.Player player) => Player(
      id: player.id,
      name: player.name,
      isCurrentTurn: player.isCurrentTurn,
      won: player.won,
      wonSets: player.wonSets,
      wonLegsCurrentSet: player.wonLegsCurrentSet,
      pointsLeft: player.pointsLeft,
      finishRecommendation: player.finishRecommendation,
      lastPoints: player.lastPoints,
      dartsThrownCurrentLeg: player.dartsThrownCurrentLeg,
      stats: parseStats(player.stats),
      sets: player.sets.map((set) => parseSet(set)).toList(),
    );

    for (dartGame.Player player in game.players) {
      players.add(parsePlayer(player));
    }

    return Game(
      status: status,
      mode: mode,
      size: size,
      type: type,
      startingPoints: startingPoints,
      players: players,
    );
  }

  Game _parseOnlineGame() {
    throw UnimplementedError();
  }
}