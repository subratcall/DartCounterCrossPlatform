
import 'package:dart_counter/assets/my_flutter_app_icons.dart';
import 'package:dart_counter/routes.dart';
import 'package:dart_counter/view/screen.dart';
import 'package:dart_counter/viewmodel/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Screen<HomeViewModel>(
        builder: (context, model, child) {
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              leading: CupertinoButton(
                padding: EdgeInsets.zero,
                child: Icon(MyFlutterApp.menu, size: 35),
                onPressed: () {},
              ),
              middle: Text(AppLocalizations.of(context).titleHome),
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
        }
    );
  }
}


