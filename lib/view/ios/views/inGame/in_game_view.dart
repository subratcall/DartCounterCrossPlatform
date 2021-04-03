import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/view/ios/views/inGame/stats/in_game_stats_view.dart';
import 'package:dart_counter/view/ios/views/inGame/widgets/four_player.dart';
import 'package:dart_counter/view/ios/views/inGame/widgets/input_row.dart';
import 'package:dart_counter/view/ios/views/inGame/widgets/key_board.dart';
import 'package:dart_counter/view/ios/views/inGame/widgets/one_player.dart';
import 'package:dart_counter/view/ios/views/inGame/widgets/three_player.dart';
import 'package:dart_counter/view/ios/views/inGame/widgets/two_player.dart';
import 'package:dart_counter/view/ios/views/loading_view.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/in_game_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'ingame_view_mobile_portrait.dart';

class InGameView extends StatefulWidget {

  @override
  _InGameViewState createState() => _InGameViewState();
}

class _InGameViewState extends State<InGameView> {
  final InGameViewModel model = InGameViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return View(
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

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }
}