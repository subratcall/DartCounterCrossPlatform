import 'package:dart_counter/model/game/offline_game.dart';
import 'package:dart_counter/services/database/database_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:rxdart/rxdart.dart';

abstract class GameHistoryViewModel extends ViewModel {
  /// IN

  void fetchGameHistory();
  /// OUT

  ValueStream<List<OfflineGame>> get outputGames;

  /// METHODS
}

class GameHistoryViewModelImpl extends GameHistoryViewModel {
  final DatabaseService _databaseService = DatabaseService.instance;

  @override
  void fetchGameHistory() {
    _databaseService.fetchGameHistory();
  }

  @override
  ValueStream<List<OfflineGame>> get outputGames => _databaseService.gameHistory;
}
