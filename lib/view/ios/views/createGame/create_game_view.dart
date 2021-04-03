import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/create_game_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'create_game_view_mobile_portrait.dart';

class CreateGameView extends StatefulWidget {
  @override
  _CreateGameViewState createState() => _CreateGameViewState();
}

class _CreateGameViewState extends State<CreateGameView> {
  final CreateGameViewModel model = CreateGameViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return View(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context).createGame),
      ),
      mobilePortrait: CreateGameViewMobilePortrait(model),
    );
  }

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }
}
