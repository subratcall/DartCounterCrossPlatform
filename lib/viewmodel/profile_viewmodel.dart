import 'package:dart_counter/api/database.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/model/profile.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

class ProfileViewModel extends ViewModel {

  final DatabaseService _databaseService = locator<DatabaseService>();

  Stream<Profile> profile() {
    return _databaseService.profile('JOAVDAkIiyfOswHtNjquCbe7fyh2');
  }

}
