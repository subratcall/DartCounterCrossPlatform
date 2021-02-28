
import 'package:dart_counter/routes.dart';
import 'package:dart_counter/view/ios/modal/modal_fit.dart';
import 'package:dart_counter/view/screen.dart';
import 'package:dart_counter/viewmodel/create_game_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Screen<CreateGameViewModel>(
        builder: (context, model, child) {
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              leading: CupertinoButton(
                padding: EdgeInsets.zero,
                child: Icon(CupertinoIcons.chevron_back, size: 35),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              middle: Text(AppLocalizations.of(context).titleCreateGame),
            ),
            child: SafeArea(
                child: Column(children: [
                  CupertinoButton(
                      child: Text('InGame'),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.inGame);
                      }),
                  CupertinoButton(
                      child: Text('Advanced Settings'),
                      onPressed: () => showCupertinoModalBottomSheet(
                        expand: false,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => ModalFit(),
                      ))
                ])),
          );
        }
    );
  }
}
