import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/create_online_game_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'create_online_game_view_mobile_portrait.dart';


class CreateOnlineGameView extends StatefulWidget {
  @override
  _CreateOnlineGameViewState createState() => _CreateOnlineGameViewState();
}

class _CreateOnlineGameViewState extends State<CreateOnlineGameView> {
  final CreateOnlineGameViewModel model = CreateOnlineGameViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return View(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context).createGame),
      ),
      mobilePortrait: CreateOnlineGameViewMobilePortrait(model),
    );
  }

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }
}
