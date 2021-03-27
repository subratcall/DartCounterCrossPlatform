import 'package:dart_counter/viewmodel/about_us_viewmodel.dart';
import 'package:dart_counter/viewmodel/reset_password_viewmodel.dart';
import 'package:dart_counter/viewmodel/sign_in_facebook_viewmodel.dart';
import 'package:dart_counter/viewmodel/sign_in_google_viewmodel.dart';
import 'package:dart_counter/viewmodel/sign_in_instagram_viewmodel.dart';
import 'package:dart_counter/viewmodel/sign_in_viewmodel.dart';
import 'package:dart_counter/viewmodel/sign_up_viewmodel.dart';
import 'package:dart_counter/viewmodel/checkout_details_viewmodel.dart';
import 'package:dart_counter/viewmodel/create_game_viewmodel.dart';
import 'package:dart_counter/viewmodel/friends_viewmodel.dart';
import 'package:dart_counter/viewmodel/game_history_viewmodel.dart';
import 'package:dart_counter/viewmodel/home_viewmodel.dart';
import 'package:dart_counter/viewmodel/in_game_viewmodel.dart';
import 'package:dart_counter/viewmodel/invites_viewmodel.dart';
import 'package:dart_counter/viewmodel/profile_viewmodel.dart';
import 'package:dart_counter/viewmodel/settings_viewmodel.dart';
import 'package:dart_counter/viewmodel/social_media_viewmodel.dart';
import 'package:dart_counter/viewmodel/stats_viewmodel.dart';
import 'package:get_it/get_it.dart';

import 'app_model.dart';
import 'services/authentication_service.dart';
import 'services/database_service.dart';
import 'services/playing/playing_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  /// Register AppModel here (must be first)
  locator.registerLazySingleton<AppModel>(() => AppModel());

  /// Register Services here
  locator.registerLazySingleton<AuthenticationService>(
      () => AuthenticationService());
  locator.registerLazySingleton<DatabaseService>(() => DatabaseService());
  locator.registerLazySingleton<PlayingService>(() => PlayingService());

  /// Register Viewmodels here
  locator.registerFactory(() => AboutUsViewModel());
  locator.registerFactory(() => CheckoutDetailsViewModel());
  locator.registerFactory(() => CreateGameViewModel());
  locator.registerFactory(() => FriendsViewModel());
  locator.registerFactory(() => GameHistoryViewModel());
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => InGameViewModel());
  locator.registerFactory(() => InvitesViewModel());
  locator.registerFactory(() => ProfileViewModel());
  locator.registerFactory(() => SettingsViewModel());
  locator.registerFactory(() => SignInViewModel());
  locator.registerFactory(() => SignUpViewModel());
  locator.registerFactory(() => SocialMediaViewModel());
  locator.registerFactory(() => StatsViewModel());
  locator.registerFactory(() => ResetPasswordViewModel());
  locator.registerFactory(() => SignInFacebookViewModel());
  locator.registerFactory(() => SignInGoogleViewModel());
  locator.registerFactory(() => SignInInstagramViewModel());
}
