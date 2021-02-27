
import 'package:dart_counter/viewmodel/sign_in_viewmodel.dart';
import 'package:get_it/get_it.dart';

import 'api/authentication.dart';
import 'api/database.dart';
import 'api/playing.dart';
import 'app_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {

  /// Register AppModel here
  locator.registerLazySingleton<AppModel>(() => AppModel());

  /// Register Services here
  locator.registerLazySingleton<AuthenticationService>(() => AuthenticationService());
  locator.registerLazySingleton<DatabaseService>(() => DatabaseService());
  locator.registerLazySingleton(() => PlayingService());

  /// Register Viewmodels here
  locator.registerFactory(() => SignInViewModel());

}

