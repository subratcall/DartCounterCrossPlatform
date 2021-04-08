import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/view/ios/views/inGame/stats/in_game_stats_view.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/in_game_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'ingame_view_mobile_portrait.dart';

class InGameView extends StatefulWidget {

  final bool online;

  InGameView(this.online);

  @override
  _InGameViewState createState() => _InGameViewState();
}

class _InGameViewState extends State<InGameView> {

   InGameViewModel model;

  @override
  void initState() {
    model = InGameViewModelImpl(widget.online);
    super.initState();
  }

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
