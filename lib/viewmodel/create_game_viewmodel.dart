import 'dart:async';

import 'package:dart_counter/locator.dart';
import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/services/playing/playing_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';


abstract class CreateGameViewModel  extends ViewModel{

  /// IN
  Sink get inputDartBotActive;

  /// OUT

  Stream<Game> get outputSnapshots;

  Stream<bool> get outputDartBotActive;


  /// METHODS

}

class CreateGameViewModelImpl implements CreateGameViewModel {
  final PlayingService _playingService = locator<PlayingService>();

  CreateGameViewModelImpl() {
    _dartBotActiveController.stream.li
  }

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


  void onDartBotAverageChanged(int average) {
    _playingService.setDartBotAverage(average);
  }

  void onAddPlayerPressed() {
    _playingService.addPlayer();
  }

  void onStartingPointsChanged(int startingPoints) {
    _playingService.setStartingPoints(startingPoints);
  }

  void onModeChanged(Mode mode) {
    _playingService.setMode(mode);
  }

  void onSizeChanged(int size) {
    _playingService.setSize(size);
  }

  void onTypeChanged(Type type) {
    _playingService.setType(type);
  }

  void onStartGamePressed() {
    _playingService.startGame();
  }

  void onRemovePlayer(int id) {
    _playingService.removePlayer(id);
  }

  void onNameChanged(int id, String newName) {
    _playingService.updateName(id, newName);
  }

  void onReorderPlayer(int oldIndex, int newIndex) {
    _playingService.reorderPlayer(oldIndex, newIndex);
  }

  @override
  void dispose() {
    _dartBotActiveController.close();
  }

}
