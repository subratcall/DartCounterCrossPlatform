import 'dart:async';

import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/services/database/database_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

abstract class GameHistoryViewModel extends ViewModel {
  /// IN

  /// OUT

  Stream<List<Game>> get outputGames;

  /// METHODS

  void fetchGames();
}

class GameHistoryViewModelImpl extends GameHistoryViewModel {
  final DatabaseService _databaseService = DatabaseService.instance;

  final StreamController<List<Game>> _gamesController =
      StreamController.broadcast();

  @override
  Stream<List<Game>> get outputGames => _gamesController.stream;

  @override
  void fetchGames() async {
    await Future.delayed(const Duration(milliseconds: 400), () {});
    List<Game> games = await _databaseService.fetchGameHistory(_appModel.uid);
    _gamesController.add(games);
  }

  @override
  void dispose() {
    _gamesController.close();
  }
}
