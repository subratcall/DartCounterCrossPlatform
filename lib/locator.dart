import 'package:get_it/get_it.dart';

import 'app_model.dart';
import 'services/authentication_service.dart';
import 'services/database_service.dart';
import 'services/playing/playing_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  /// Register AppModel here
  locator.registerLazySingleton<AppModel>(() => AppModel());

  /// Register Services here
  locator.registerLazySingleton<AuthenticationService>(
      () => AuthenticationService());
  locator.registerLazySingleton<DatabaseService>(() => DatabaseService());
  locator.registerLazySingleton<PlayingService>(() => PlayingService());

}
