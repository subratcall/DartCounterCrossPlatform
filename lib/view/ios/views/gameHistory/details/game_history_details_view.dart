import 'package:dart_counter/model/game/offline_game.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:flutter/cupertino.dart';

import 'game_history_details_view_mobile_portrait.dart';

class GameHistoryDetailsView extends StatelessWidget {
  final OfflineGame game;

  GameHistoryDetailsView(this.game);

  @override
  Widget build(BuildContext context) {
    return View(
      navigationBar: CupertinoNavigationBar(
        middle: Text(game.description),
      ),
      mobilePortrait: GameHistoryDetailsViewMobilePortrait(game),
    );
  }
}
