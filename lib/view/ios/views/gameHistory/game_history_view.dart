import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/game_history_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'game_history_view_mobile_portrait.dart';

class GameHistoryView extends StatefulWidget {
  @override
  _GameHistoryViewState createState() => _GameHistoryViewState();
}

class _GameHistoryViewState extends State<GameHistoryView> {
  final GameHistoryViewModel model = GameHistoryViewModelImpl();

  @override
  void initState() {
    model.fetchGameHistory();
    super.initState();
  }

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
