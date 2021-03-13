import 'dart:io';

import 'package:dart_counter/services/authentication_service.dart';
import 'package:dart_counter/app_routes.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/view/android/export.dart' as android;
import 'package:dart_counter/view/ios/export.dart' as ios;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'services/database_service.dart';
import 'app_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  //DatabaseService().insertDummyData('oUSndXHVqbhFZ4as6e5xR9tr33h2');
  runApp(DartCounterApp());
}

class DartCounterApp extends StatelessWidget {
  final controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: locator<AuthenticationService>().authStateChanged,
      builder: (context, snapshot) {
        if (Platform.isIOS) {
          // Init IOS App
          return CupertinoApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: Builder(builder: (context) {
              var appModel = locator<AppModel>();
              var user = snapshot.data;
              if (user != null) {
                appModel.uid = user.uid;
                return ios.HomeView();
              } else {
                appModel.uid = null;
                return PageView(
                  controller: controller,
                  children: [
                    ios.SignInView(controller),
                    ios.SignUpView(controller),
                  ],
                );
              }
            }),
            routes: {
              AppRoutes.loading: (context) => ios.LoadingView(),
              AppRoutes.home: (context) => ios.HomeView(),
              AppRoutes.profile: (context) => ios.ProfileView(),
              AppRoutes.invite: (context) => ios.InvitesView(),
              AppRoutes.gameHistory: (context) => ios.GameHistoryView(),
              AppRoutes.friends: (context) => ios.FriendsView(),
              AppRoutes.settings: (context) => ios.SettingsView(),
              AppRoutes.aboutUs: (context) => ios.AboutUsView(),
              AppRoutes.socialMedia: (context) => ios.SocialMediaView(),
              AppRoutes.createGame: (context) => ios.CreateGameView(),
              AppRoutes.inGame: (context) => ios.InGameView(),
              AppRoutes.postGame: (context) => ios.PostGameView(),
            },
            theme: ios.Theme.theme,
          );
        } else {
          // Init Android App
          return MaterialApp(
            home: android.SignInView(),
            routes: {
              AppRoutes.loading: (context) => android.LoadingView(),
              AppRoutes.home: (context) => android.HomeView(),
              AppRoutes.profile: (context) => android.ProfileView(),
              AppRoutes.invite: (context) => android.InvitesView(),
              AppRoutes.gameHistory: (context) => android.GameHistoryView(),
              AppRoutes.friends: (context) => android.FriendsView(),
              AppRoutes.settings: (context) => android.SettingsView(),
              AppRoutes.aboutUs: (context) => android.AboutUsView(),
              AppRoutes.socialMedia: (context) => android.SocialMediaView(),
              AppRoutes.createGame: (context) => android.CreateGameView(),
              AppRoutes.inGame: (context) => android.InGameView(),
              AppRoutes.postGame: (context) => android.PostGameView(),
            },
            // TODO further bootstrapping
          );
        }
      },
    );
  }
}
