import 'dart:io';

import 'package:dart_counter/api/authentication.dart';
import 'package:dart_counter/app_routes.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/view/android/views/views.dart' as android;
import 'package:dart_counter/view/ios/views/views.dart' as ios;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
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
            home: snapshot.data != null
                ? ios.HomeView()
                : PageView(
                    controller: controller,
                    children: [
                      ios.SignInView(controller),
                      ios.SignUpView(controller),
                    ],
                  ),
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
              AppRoutes.checkoutDetails: (context) => ios.CheckoutDetailsView(),
              AppRoutes.stats: (context) => ios.StatsView(),
              AppRoutes.resetPassword: (context) => ios.ResetPasswordView(),
            },
            theme: CupertinoThemeData(primaryColor: Colors.black),
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
              AppRoutes.checkoutDetails: (context) =>
                  android.CheckoutDetailsView(),
              AppRoutes.stats: (context) => android.StatsView(),
              AppRoutes.resetPassword: (context) => android.ResetPasswordView(),
            },
            // TODO further bootstrapping
          );
        }
      },
    );
  }
}
