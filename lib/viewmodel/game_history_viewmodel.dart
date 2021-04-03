import 'dart:async';

import 'package:dart_counter/app_model.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/services/database_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

abstract class GameHistoryViewModel extends ViewModel {
  /// IN

  /// OUT

  Stream<List<Game>> get outputGames;

  /// METHODS

  void fetchGames();
}

class GameHistoryViewModelImpl extends GameHistoryViewModel {
  final AppModel _appModel = locator<AppModel>();

  final DatabaseService _databaseService = locator<DatabaseService>();

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
