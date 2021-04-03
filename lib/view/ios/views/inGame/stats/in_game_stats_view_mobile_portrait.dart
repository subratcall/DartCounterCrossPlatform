import 'package:dart_counter/viewmodel/in_game_stats_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class InGameStatsViewMobilePortrait extends StatelessWidget {
  final InGameStatsViewModel model;

  InGameStatsViewMobilePortrait(this.model);

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
