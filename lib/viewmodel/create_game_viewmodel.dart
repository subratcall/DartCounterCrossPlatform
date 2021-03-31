import 'dart:async';

import 'package:dart_counter/locator.dart';
import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/services/playing/playing_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';


abstract class CreateGameViewModel  extends ViewModel{

  Game currentSnapshot;


  /// IN
  Sink get inputDartBotActive;

  /// OUT

  Stream<Game> get outputSnapshots;

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

class CreateGameViewModelImpl implements CreateGameViewModel {
  final PlayingService _playingService = locator<PlayingService>();

  Game currentSnapshot = Game();

  StreamController<bool> _dartBotActiveController = StreamController.broadcast();

  /// IN
  @override
  Sink get inputDartBotActive => _dartBotActiveController;


  /// OUT
  @override
  Stream<ViewState> get outputViewState => throw UnimplementedError();


  @override
  Stream<Game> get outputSnapshots => throw UnimplementedError();

  @override
  Stream<bool> get outputDartBotActive  => throw UnimplementedError();


  @override
  void onDartBotAverageChanged(int average) {
    _playingService.setDartBotAverage(average);
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
