import 'dart:async';

import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/model/leg.dart';
import 'package:dart_counter/model/player.dart';
import 'package:dart_counter/model/set.dart';
import 'package:dart_counter/model/stats.dart';
import 'package:dart_counter/model/throw.dart';
import 'package:dart_counter/services/playing/service.dart';
import 'package:dart_game/dart_game.dart' as DartGame;

class PlayingOfflineService extends AbstractPlayingService {
  static final PlayingOfflineService instance = PlayingOfflineService._();

  PlayingOfflineService._();

  StreamController<Event> controller = StreamController<Event>.broadcast();

  DartGame.Game _game;

  @override
  Stream<Event> onEvent() => controller.stream;

  void createGame() {
    _game = DartGame.Game();
    _addSnapshotEvent();
  }

  void addDartBot() {
    _game.addDartBot();
    _addSnapshotEvent();
  }

  void removeDartBot() {
    _game.removeDartBot();
    _addSnapshotEvent();
  }

  void setDartBotTargetAverage(int targetAverage) {
    _game.setDartBotTargetAverage(targetAverage);
  }

  void addPlayer() {
    _game.addPlayer();
    _addSnapshotEvent();
  }

  void removePlayer(int id) {
    _game.removePlayer(id);
    _addSnapshotEvent();
  }

  void setStartingPoints(int startingPoints) {
    _game.config.startingPoints = startingPoints;
  }

  void setMode(Mode mode) {
    _game.config.mode =
        mode == Mode.firstTo ? DartGame.Mode.firstTo : DartGame.Mode.bestOf;
  }

  void setSize(int size) {
    _game.config.size = size;
  }

  void setType(Type type) {
    _game.config.type =
        type == Type.legs ? DartGame.Type.legs : DartGame.Type.sets;
  }

  void startGame() {
    _game.start();
    _addSnapshotEvent();
  }

  void performThrow(int points, int dartsThrown, int dartsOnDouble) {
    _game.performThrow(DartGame.Throw(points,
        dartsThrown: dartsThrown, dartsOnDouble: dartsOnDouble));
    _addSnapshotEvent();
  }

  void undoThrow() {
    _game.undoThrow();
    _addSnapshotEvent();
  }

  void updateName(int id, String newName) {
    _game.players.firstWhere((player) => player.id == id).name = newName;
  }


  void _addSnapshotEvent() {
    Status status = _game.status == DartGame.Status.pending
        ? Status.pending
        : _game.status == DartGame.Status.running
            ? Status.running
            : Status.pending;
    Mode mode =
        _game.config.mode == DartGame.Mode.firstTo ? Mode.firstTo : Mode.bestOf;
    int size = _game.config.size;
    Type type = _game.config.type == DartGame.Type.legs ? Type.legs : Type.sets;
    int startingPoints = _game.config.startingPoints;
    List<Player> players = [];

    Stats parseStats(DartGame.Stats stats) => Stats(
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

    Throw parseThrow(DartGame.Throw t) => Throw(
        points: t.points,
        dartsThrown: t.dartsThrown,
        dartsOnDouble: t.dartsOnDouble);

    Leg parseLeg(DartGame.Leg leg) =>
        Leg(throws: leg.throws.map((t) => parseThrow(t)).toList());

    Set parseSet(DartGame.Set set) => Set(
          legs: set.legs.map((leg) => parseLeg(leg)).toList(),
        );

    Player parsePlayer(DartGame.Player player) => Player(
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

    for (DartGame.Player player in _game.players) {
      players.add(parsePlayer(player));
    }

    Game game = Game(
      status: status,
      mode: mode,
      size: size,
      type: type,
      startingPoints: startingPoints,
      players: players,
    );
    controller.add(Event<Game>(game));
  }

  void dispose() {
    controller.close();
  }
}
