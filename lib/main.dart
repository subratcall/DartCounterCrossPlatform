import 'dart:io';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/routes.dart';
import 'package:dart_counter/view/android/screen/screens.dart' as android;
import 'package:dart_counter/view/ios/screen/screens.dart' as ios;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(DartCounterApp());
}

class DartCounterApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: ios.SignInScreen(),
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
        },
        // TODO further bootstrapping
      );
    }
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
