import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/view/ios/views/inGame/widgets/four_player.dart';
import 'package:dart_counter/view/ios/views/inGame/widgets/input_row.dart';
import 'package:dart_counter/view/ios/views/inGame/widgets/key_board.dart';
import 'package:dart_counter/view/ios/views/inGame/widgets/one_player.dart';
import 'package:dart_counter/view/ios/views/inGame/widgets/three_player.dart';
import 'package:dart_counter/view/ios/views/inGame/widgets/two_player.dart';
import 'package:dart_counter/view/ios/views/in_game_stats_view.dart';
import 'package:dart_counter/view/ios/views/loading_view.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/in_game_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class InGameView extends StatelessWidget {

  final InGameViewModel model = InGameViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return View2(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.xmark, size: 35),
          onPressed: () => Navigator.pop(context),
        ),
        middle: Text(model.currentSnapshot.description),
        trailing: Builder(
          builder: (context) => CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(CupertinoIcons.chart_bar_fill, size: 35),
            onPressed: () => CupertinoScaffold.showCupertinoModalBottomSheet(
              expand: true,
              context: context,
              backgroundColor: AppColors.transparent,
              builder: (context) => InGameStatsView(),
            ),
          ),
        ),
      ),
      mobilePortrait: InGameViewMobilePortrait(model),
    );
  }
}


class InGameViewMobilePortrait extends StatelessWidget {

  final InGameViewModel model;

  InGameViewMobilePortrait(this.model);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
          final double width = boxConstraints.maxWidth;
          final double height = boxConstraints.maxHeight;
          return Builder(builder: (context) {
            Game game = model.currentSnapshot;
            return game != null
                ? Row(
              children: [
                Spacer(
                  flex: 8,
                ),
                Expanded(
                  flex: 359,
                  child: Column(
                    children: [
                      Spacer(
                        flex: 4,
                      ),
                      Expanded(
                        flex: 318,
                        child: game.players.length == 1
                            ? OnePlayer(
                          game.players[0],
                        )
                            : game.players.length == 2
                            ? TwoPlayer(
                          game.players,
                        )
                            : game.players.length == 3
                            ? ThreePlayer(
                          game.players,
                        )
                            : FourPlayer(
                          game.players,
                        ),
                      ),
                      Spacer(
                        flex: 4,
                      ),
                      Expanded(
                        flex: 64,
                        child: InputRow(
                          onUndoPressed: () => model.onUndoPressed(),
                          onPerformThrowPressed: () =>
                              model.onPerformThrowPressed(),
                          points: model.inputPoints,
                        ),
                      ),
                      Spacer(
                        flex: 4,
                      ),
                      Expanded(
                        flex: 289,
                        child: KeyBoard(
                          onKeyPressed: (key) => model.onKeyPressed(key),
                        ),
                      ),
                      Spacer(
                        flex: 4,
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 8,
                ),
              ],
            )
                : LoadingView();
          });
        }
    );
  }
}