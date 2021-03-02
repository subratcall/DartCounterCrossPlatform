import 'dart:io';

import 'package:dart_counter/api/authentication.dart';
import 'package:dart_counter/app_routes.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/view/android/screen/screens.dart' as android;
import 'package:dart_counter/view/ios/screen/screens.dart' as ios;
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
                ? ios.HomeScreen()
                : PageView(
                    controller: controller,
                    children: [
                      ios.SignInScreen(controller),
                      ios.SignUpScreen(controller),
                    ],
                  ),
            routes: {
              AppRoutes.loading: (context) => ios.LoadingScreen(),
              AppRoutes.home: (context) => ios.HomeScreen(),
              AppRoutes.profile: (context) => ios.ProfileScreen(),
              AppRoutes.invite: (context) => ios.InvitesScreen(),
              AppRoutes.gameHistory: (context) => ios.GameHistoryScreen(),
              AppRoutes.friends: (context) => ios.FriendsScreen(),
              AppRoutes.settings: (context) => ios.SettingsScreen(),
              AppRoutes.aboutUs: (context) => ios.AboutUsScreen(),
              AppRoutes.socialMedia: (context) => ios.SocialMediaScreen(),
              AppRoutes.createGame: (context) => ios.CreateGameScreen(),
              AppRoutes.inGame: (context) => ios.InGameScreen(),
              AppRoutes.checkoutDetails: (context) =>
                  ios.CheckoutDetailsScreen(),
              AppRoutes.stats: (context) => ios.StatsScreen(),
              AppRoutes.resetPassword: (context) => ios.ResetPasswordScreen(),
            },
            theme: CupertinoThemeData(primaryColor: Colors.black),
          );
        } else {
          // Init Android App
          return MaterialApp(
            home: android.SignInScreen(),
            routes: {
              AppRoutes.loading: (context) => android.LoadingScreen(),
              AppRoutes.signIn: (context) => android.SignInScreen(),
              AppRoutes.signUp: (context) => android.SignUpScreen(),
              AppRoutes.home: (context) => android.HomeScreen(),
              AppRoutes.profile: (context) => android.ProfileScreen(),
              AppRoutes.invite: (context) => android.InvitesScreen(),
              AppRoutes.gameHistory: (context) => android.GameHistoryScreen(),
              AppRoutes.friends: (context) => android.FriendsScreen(),
              AppRoutes.settings: (context) => android.SettingsScreen(),
              AppRoutes.aboutUs: (context) => android.AboutUsScreen(),
              AppRoutes.socialMedia: (context) => android.SocialMediaScreen(),
              AppRoutes.createGame: (context) => android.CreateGameScreen(),
              AppRoutes.inGame: (context) => android.InGameScreen(),
              AppRoutes.checkoutDetails: (context) =>
                  android.CheckoutDetailsScreen(),
              AppRoutes.stats: (context) => android.StatsScreen(),
              AppRoutes.resetPassword: (context) =>
                  android.ResetPasswordScreen(),
            },
            // TODO further bootstrapping
          );
        }
      },
    );
  }
}
