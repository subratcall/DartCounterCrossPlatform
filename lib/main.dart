import 'dart:io';

import 'package:dart_counter/api/authentication.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/routes.dart';
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
            home: snapshot.data != null ? ios.HomeScreen() : ios.SignInScreen() ,
            routes: {
              Routes.loading: (context) => ios.LoadingScreen(),
              Routes.signIn: (context) => ios.SignInScreen(),
              Routes.signUp: (context) => ios.SignUpScreen(),
              Routes.home: (context) => ios.HomeScreen(),
              Routes.profile: (context) => ios.ProfileScreen(),
              Routes.invite: (context) => ios.InvitesScreen(),
              Routes.gameHistory: (context) => ios.GameHistoryScreen(),
              Routes.friends: (context) => ios.FriendsScreen(),
              Routes.settings: (context) => ios.SettingsScreen(),
              Routes.aboutUs: (context) => ios.AboutUsScreen(),
              Routes.socialMedia: (context) => ios.SocialMediaScreen(),
              Routes.createGame: (context) => ios.CreateGameScreen(),
              Routes.inGame: (context) => ios.InGameScreen(),
              Routes.checkoutDetails: (context) => ios.CheckoutDetailsScreen(),
              Routes.stats: (context) => ios.StatsScreen(),
              Routes.resetPassword: (context) => ios.ResetPasswordScreen(),
            },
            theme: CupertinoThemeData(primaryColor: Colors.black),
          );
        } else {
          // Init Android App
          return MaterialApp(
            home: android.SignInScreen(),
            routes: {
              Routes.loading: (context) => android.LoadingScreen(),
              Routes.signIn: (context) => android.SignInScreen(),
              Routes.signUp: (context) => android.SignUpScreen(),
              Routes.home: (context) => android.HomeScreen(),
              Routes.profile: (context) => android.ProfileScreen(),
              Routes.invite: (context) => android.InvitesScreen(),
              Routes.gameHistory: (context) => android.GameHistoryScreen(),
              Routes.friends: (context) => android.FriendsScreen(),
              Routes.settings: (context) => android.SettingsScreen(),
              Routes.aboutUs: (context) => android.AboutUsScreen(),
              Routes.socialMedia: (context) => android.SocialMediaScreen(),
              Routes.createGame: (context) => android.CreateGameScreen(),
              Routes.inGame: (context) => android.InGameScreen(),
              Routes.checkoutDetails: (context) => android.CheckoutDetailsScreen(),
              Routes.stats: (context) => android.StatsScreen(),
              Routes.resetPassword: (context) => android.ResetPasswordScreen(),
            },
            // TODO further bootstrapping
          );
        }
      },
    );
  }
}



