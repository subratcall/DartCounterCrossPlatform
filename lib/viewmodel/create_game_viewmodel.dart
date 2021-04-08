import 'dart:async';

import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/services/playing/playing_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:rxdart/rxdart.dart';

abstract class CreateGameViewModel extends ViewModel {

  /// IN
  void createGame();

  Sink get inputDartBotActive;

  /// OUT

  ValueStream<Game> get outputSnapshots;

  Stream<bool> get outputDartBotActive;

  /// METHODS

  void onDartBotAverageChanged(int average);

  void onAddPlayerPressed();

  void onStartingPointsChanged(int startingPoints);

  void onModeChanged(Mode mode);

  void onSizeChanged(int size);

  void onTypeChanged(Type type);

  void onStartGamePressed();

  void onRemovePlayer(int id);

  void onNameChanged(int id, String newName);

  void onReorderPlayer(int oldIndex, int newIndex);
}

class CreateGameViewModelImpl extends CreateGameViewModel {
  final PlayingService _playingService = PlayingService.instance;

  StreamController<bool> _dartBotActiveController =
      StreamController.broadcast();

  /// IN
  @override
  void createGame() {
    _playingService.createGame();
  }

  @override
  Sink get inputDartBotActive => _dartBotActiveController;

  /// OUT

  @override
  ValueStream<Game> get outputSnapshots => _playingService.games;

  @override
  Stream<bool> get outputDartBotActive => _dartBotActiveController.stream;

  @override
  void onDartBotAverageChanged(int average) {
    _playingService.setDartBotTargetAverage(average);
  }

  @override
  void onAddPlayerPressed() {
    _playingService.addPlayer();
  }

  @override
  void onStartingPointsChanged(int startingPoints) {
    _playingService.setStartingPoints(startingPoints);
  }

  @override
  void onModeChanged(Mode mode) {
    _playingService.setMode(mode);
  }

  @override
  void onSizeChanged(int size) {
    _playingService.setSize(size);
  }

  @override
  void onTypeChanged(Type type) {
    _playingService.setType(type);
  }

  @override
  void onStartGamePressed() {
    _playingService.startGame();
  }

  @override
  void onRemovePlayer(int id) {
    _playingService.removePlayer(id);
  }

  @override
  void onNameChanged(int id, String newName) {
    _playingService.updateName(id, newName);
  }

  @override
  void onReorderPlayer(int oldIndex, int newIndex) {
    _playingService.reorderPlayer(oldIndex, newIndex);
  }

  @override
  void dispose() {
    _dartBotActiveController.close();
  }
}
