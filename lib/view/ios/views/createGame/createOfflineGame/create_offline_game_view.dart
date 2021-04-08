import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/create_offline_game_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'create_offline_game_view_mobile_portrait.dart';

class CreateOfflineGameView extends StatefulWidget {
  @override
  _CreateOfflineGameViewState createState() => _CreateOfflineGameViewState();
}

class _CreateOfflineGameViewState extends State<CreateOfflineGameView> {
  final CreateOfflineGameViewModel model = CreateOfflineGameViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return View(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context).createGame),
      ),
      mobilePortrait: CreateOfflineGameViewMobilePortrait(model),
    );
  }

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }
}
