import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/view/ios/views/loading_view.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/game_history_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'details/game_history_details_view.dart';
import 'game_history_view_mobile_portrait.dart';
import 'widgets/game_history_card.dart';

class GameHistoryView extends StatefulWidget {

  @override
  _GameHistoryViewState createState() => _GameHistoryViewState();
}

class _GameHistoryViewState extends State<GameHistoryView> {
  final GameHistoryViewModel model = GameHistoryViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return View(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context).gameHistory),
      ),
      mobilePortrait: GameHistoryViewMobilePortrait(model),
    );
  }

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }
}