import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/view/ios/sharedWidgets/stats.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/in_game_stats_viewmodel.dart';
import 'package:dart_counter/viewmodel/stats_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class InGameStatsView extends StatelessWidget {

  final InGameStatsViewModel model = InGameStatsViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return View(
      mobilePortrait: InGameViewMobilePortrait(model),
    );
  }
}

class InGameViewMobilePortrait extends StatelessWidget {

  final InGameStatsViewModel model;

  InGameViewMobilePortrait(this.model);

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
