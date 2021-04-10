import 'package:dart_counter/model/game/game.dart';
import 'package:dart_counter/model/game/offline_game.dart';
import 'package:dart_counter/model/leg.dart';
import 'package:dart_counter/model/player/offline_player.dart';
import 'package:dart_counter/model/set.dart';
import 'package:dart_counter/model/stats.dart';
import 'package:dart_counter/model/throw.dart';
import 'package:dart_game/dart_game.dart' as dartGame;
import 'package:rxdart/rxdart.dart';

abstract class PlayingOfflineService {
  static PlayingOfflineService _instance = PlayingOfflineServiceImpl._();

  /// SINGLETON INSTANCE
  static PlayingOfflineService get instance {
    if (_instance == null) {
      _instance = PlayingOfflineServiceImpl._();
    }
    return _instance;
  }

  /// INTERFACE

  ValueStream<OfflineGame> get games;

  void createGame();

  void addDartBot();

  void removeDartBot();

  void setDartBotTargetAverage(int targetAverage);

  void addPlayer();

  void updateName(int id, String newName);

  void reorderPlayer(int oldIndex, int newIndex);

  void removePlayer(int id);

  void setStartingPoints(int startingPoints);

  void setMode(Mode mode);

  void setSize(int size);

  void setType(Type type);

  void startGame();

  void cancelGame();

  void performThrow(int points, int dartsThrown, int dartsOnDouble);

  void undoThrow();
}

class PlayingOfflineServiceImpl implements PlayingOfflineService {

  final BehaviorSubject<OfflineGame> _gamesController = new BehaviorSubject();

  dartGame.Game _game;

  PlayingOfflineServiceImpl._();

  @override
  ValueStream<OfflineGame> get games => _gamesController.stream;

  @override
  void createGame() {
    _game = dartGame.Game();
    _gamesController.add(_mapGame(_game));
  }
  
  @override
  void addDartBot() {
    _game.addDartBot();
    _gamesController.add(_mapGame(_game));
  }

  @override
  void removeDartBot() {
    _game.removeDartBot();
    _gamesController.add(_mapGame(_game));
  }

  @override
  void setDartBotTargetAverage(int targetAverage) {
    _game.setDartBotTargetAverage(targetAverage);
  }

  @override
  void addPlayer() {
    _game.addPlayer();
    _gamesController.add(_mapGame(_game));
  }

  @override
  void updateName(int id, String newName) {
    _game.players.firstWhere((player) => player.id == id).name = newName;
  }

  @override
  void reorderPlayer(int oldIndex, int newIndex) {
    _game.reorderPlayer(oldIndex, newIndex);
    _gamesController.add(_mapGame(_game));
  }

  @override
  void removePlayer(int id) {
    _game.removePlayer(id);
    _gamesController.add(_mapGame(_game));
  }

  @override
  void setStartingPoints(int startingPoints) {
    _game.config.startingPoints = startingPoints;
  }

  @override
  void setMode(Mode mode) {
    _game.config.mode = mode == Mode.firstTo ? dartGame.Mode.firstTo : dartGame.Mode.bestOf;
  }

  @override
  void setSize(int size) {
    _game.config.size = size;
  }

  @override
  void setType(Type type) {
    _game.config.type = type == Type.legs ? dartGame.Type.legs : dartGame.Type.sets;
  }

  @override
  void startGame() {
    _game.start();
    _gamesController.add(_mapGame(_game));
  }

  @override
  void cancelGame() {
    _game.cancel();
    _gamesController.add(_mapGame(_game));
  }

  @override
  void performThrow(int points, int dartsThrown, int dartsOnDouble) {
    _game.performThrow(dartGame.Throw(points, dartsThrown: dartsThrown, dartsOnDouble: dartsOnDouble));
    _gamesController.add(_mapGame(_game));
  }

  @override
  void undoThrow() {
    _game.undoThrow();
    _gamesController.add(_mapGame(_game));
  }

  dispose() {
    _gamesController.close();
  }

  OfflineGame _mapGame(dartGame.Game game) {
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
    List<OfflinePlayer> players = [];

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

    Leg parseLeg(dartGame.Leg leg) =>
        Leg(throws: leg.throws.map((t) => parseThrow(t)).toList());

    Set parseSet(dartGame.Set set) => Set(
      legs: set.legs.map((leg) => parseLeg(leg)).toList(),
    );

    OfflinePlayer parsePlayer(dartGame.Player player) => OfflinePlayer(
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

    return OfflineGame(
      status: status,
      mode: mode,
      size: size,
      type: type,
      startingPoints: startingPoints,
      players: players,
    );
  }
}
