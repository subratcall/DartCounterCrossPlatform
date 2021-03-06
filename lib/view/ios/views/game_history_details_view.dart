// TODO
import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:flutter/cupertino.dart';

class GameHistoryDetailsView extends StatelessWidget {
  final Game game;

  GameHistoryDetailsView(this.game);

  @override
  Widget build(BuildContext context) {
    return View(
      navigationBar: CupertinoNavigationBar(
        middle: Text(game.description),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        child: Center(
          child: Text(this.toStringShort() + " -- IOS"),
        ),
      ),
    );
  }
}
