import 'package:dart_counter/app_language.dart';
import 'package:dart_counter/app_model.dart';
import 'package:dart_counter/res/my_flutter_app_icons.dart';
import 'package:dart_counter/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(builder: (context, state, child) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(MyFlutterApp.menu, size: 35),
            onPressed: () {},
          ),
          middle: Text(state.settings.language.titleHome),
        ),
        child: SafeArea(
            child: Column(children: [
          CupertinoButton(
              child: Text('Profile'),
              onPressed: () {
                Navigator.pushNamed(context, Routes.profile);
              }),
          CupertinoButton(
              child: Text('CreateGame'),
              onPressed: () {
                Navigator.pushNamed(context, Routes.createGame);
              }),
          CupertinoButton(
              child: Text('SocialMedia'),
              onPressed: () {
                Navigator.pushNamed(context, Routes.socialMedia);
              }),
          CupertinoButton(
              child: Text('Settings'),
              onPressed: () {
                Navigator.pushNamed(context, Routes.settings);
              }),
          CupertinoButton(
              child: Text('Invite'),
              onPressed: () {
                Navigator.pushNamed(context, Routes.invite);
              }),
          CupertinoButton(
              child: Text('Friends'),
              onPressed: () {
                Navigator.pushNamed(context, Routes.friends);
              }),
          CupertinoButton(
              child: Text('AboutUs'),
              onPressed: () {
                Navigator.pushNamed(context, Routes.aboutUs);
              }),
        ])),
      );
    });
  }
}
