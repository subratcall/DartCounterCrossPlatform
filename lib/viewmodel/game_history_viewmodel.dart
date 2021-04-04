import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/services/database/database_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:rxdart/rxdart.dart';

abstract class GameHistoryViewModel extends ViewModel {
  /// IN

  /// OUT

  ValueStream<List<Game>> get outputGames;

  /// METHODS
}

class GameHistoryViewModelImpl extends GameHistoryViewModel {
  final DatabaseService _databaseService = DatabaseService.instance;

  @override
  ValueStream<List<Game>> get outputGames => _databaseService.gameHistory;
}
