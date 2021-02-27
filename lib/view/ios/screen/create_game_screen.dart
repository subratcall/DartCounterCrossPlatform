import 'package:dart_counter/app_language.dart';
import 'package:dart_counter/app_model.dart';
import 'package:dart_counter/routes.dart';
import 'package:dart_counter/view/ios/modals/modal_fit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class CreateGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(builder: (context, state, child) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(CupertinoIcons.chevron_back, size: 35),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          middle: Text(state.settings.language.titleCreateGame),
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
    });
  }
}
