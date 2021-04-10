import 'package:dart_counter/model/game/game.dart';
import 'package:dart_counter/services/playing/playing_online_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:rxdart/rxdart.dart';

abstract class CreateOnlineGameViewModel extends ViewModel {

  /// OUT
  ValueStream<PlayingOnlineServiceEvent> get outputEvents;

  /// METHODS
  Future<bool> connect();

  Future<bool> disconnect();

  void onAddPlayerPressed();

  void onStartingPointsChanged(int startingPoints);

  void onModeChanged(Mode mode);

  void onSizeChanged(int size);

  void onTypeChanged(Type type);

  void onStartGamePressed();

  void onRemovePlayer(int id);

  void onReorderPlayer(int oldIndex, int newIndex);

  void onCancelGamePressed();
}

class CreateOnlineGameViewModelImpl extends CreateOnlineGameViewModel {

  final PlayingOnlineService _playingOnlineService = PlayingOnlineService.instance;

  /// OUT
  @override
  ValueStream<PlayingOnlineServiceEvent> get outputEvents => _playingOnlineService.events;

  @override
  Future<bool> connect() async {
    return _playingOnlineService.connect();
  }

  @override
  Future<bool> disconnect() async {
    return _playingOnlineService.connect();
  }

  void onAddPlayerPressed() {
    throw UnimplementedError(); // TODO
  }

  void onStartingPointsChanged(int startingPoints) {
    _playingOnlineService.setStartingPoints(startingPoints);
  }

  void onModeChanged(Mode mode) {
    _playingOnlineService.setMode(mode);
  }

  void onSizeChanged(int size) {
    _playingOnlineService.setSize(size);
  }

  void onTypeChanged(Type type) {
    _playingOnlineService.setType(type);
  }

  void onStartGamePressed() {
    _playingOnlineService.startGame();
  }

  void onRemovePlayer(int id) {
    _playingOnlineService.removePlayer(id);
  }

  void onReorderPlayer(int oldIndex, int newIndex) {
    _playingOnlineService.reorderPlayer(oldIndex, newIndex);
  }

  void onCancelGamePressed() {
    _playingOnlineService.cancelGame();
  }
}