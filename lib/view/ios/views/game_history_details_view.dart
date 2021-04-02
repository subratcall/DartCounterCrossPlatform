// TODO
import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/game_history_details_viewmodel.dart';
import 'package:dart_counter/viewmodel/game_history_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class GameHistoryDetailsView extends StatelessWidget {

  final GameHistoryDetailsViewModel model = GameHistoryDetailsViewModelImpl();
  final Game game;

  GameHistoryDetailsView(this.game);

  @override
  Widget build(BuildContext context) {
    return View(
      navigationBar: CupertinoNavigationBar(
        middle: Text(game.description),
      ),
      mobilePortrait: GameHistoryDetailsViewMobilePortrait(model, game),
    );
  }
}

class GameHistoryDetailsViewMobilePortrait extends StatelessWidget {

  final GameHistoryDetailsViewModel model;
  final Game game;

  GameHistoryDetailsViewMobilePortrait(this.model, this.game);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
          final double width = boxConstraints.maxWidth;
          final double height = boxConstraints.maxHeight;
          return Center(
            child: Text(this.toStringShort() + " -- IOS"),
          );
        }
    );
  }
}

