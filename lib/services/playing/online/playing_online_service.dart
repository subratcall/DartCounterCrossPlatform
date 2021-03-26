import 'dart:async';

import 'package:dart_counter/services/playing/service.dart';

class PlayingOnlineService extends AbstractPlayingService {
  static final PlayingOnlineService instance = PlayingOnlineService._();

  PlayingOnlineService._();

  StreamController<Event> controller = StreamController<Event>.broadcast();

  @override
  // TODO: implement onEvent
  Stream<Event> onEvent() => controller.stream;

  Future<bool> connect() {}

  Future<bool> disconnect() {}

  void createGame() {}

  void changeGameConfig() {}

  void joinGame(String gameId) {}

  void toggleMode() {}

  void setSize(int size) {}

  void toggleType() {}

  void setStartingPoints(int startingPoints) {}

  bool addPlayer() {}

  void removePlayer(int index) {}

  void startGame() {}

  void performThrow(int points, int dartsThrown, int dartsOnDouble) {}

  void undoThrow() {}

  void dispose() {
    controller.close();
  }
}
