import 'package:dart_counter/app_routes.dart';
import 'package:dart_counter/assets/app_icons.dart';
import 'package:dart_counter/view/screen.dart';
import 'package:dart_counter/viewmodel/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Screen<HomeViewModel>(builder: (context, model, child) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(AppIcons.menu, size: 35),
            onPressed: () {},
          ),
          middle: Text(AppLocalizations.of(context).home),
        ),
        child: SafeArea(
            child: Column(children: [
          CupertinoButton(
              child: Text('Profile'),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.profile);
              }),
          CupertinoButton(
              child: Text('CreateGame'),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.createGame);
              }),
          CupertinoButton(
              child: Text('SocialMedia'),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.socialMedia);
              }),
          CupertinoButton(
              child: Text('Settings'),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.settings);
              }),
          CupertinoButton(
              child: Text('Invite'),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.invite);
              }),
          CupertinoButton(
              child: Text('Friends'),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.friends);
              }),
          CupertinoButton(
              child: Text('AboutUs'),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.aboutUs);
              }),
          CupertinoButton(
              child: Text('Log out'),
              onPressed: () {
                model.signOut();
              }),
        ])),
      );
    });
  }
}
