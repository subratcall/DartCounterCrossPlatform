import 'package:dart_counter/model/game/offline_game.dart';
import 'package:flutter/cupertino.dart';

class GameHistoryDetailsViewMobilePortrait extends StatelessWidget {
  final OfflineGame game;

  GameHistoryDetailsViewMobilePortrait(this.game);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
      final double width = boxConstraints.maxWidth;
      final double height = boxConstraints.maxHeight;
      return Center(
        child: Text(this.toStringShort() + " -- IOS"),
      );
    });
  }
}
