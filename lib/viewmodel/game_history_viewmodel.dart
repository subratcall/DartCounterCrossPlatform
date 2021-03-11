import 'package:dart_counter/api/database_service.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

class GameHistoryViewModel extends ViewModel {

  final DatabaseService _databaseService = locator<DatabaseService>();

  Future<List<Game>> fetchGames() async {
    await Future.delayed(const Duration(milliseconds: 400), () {});
    return _databaseService.fetchGameHistory(appModel.uid);
  }
}
