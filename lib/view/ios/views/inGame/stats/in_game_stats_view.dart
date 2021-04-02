import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/in_game_stats_viewmodel.dart';
import 'package:flutter/cupertino.dart';

import 'in_game_stats_view_mobile_portrait.dart';

class InGameStatsView extends StatelessWidget {

  final InGameStatsViewModel model = InGameStatsViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return View(
      mobilePortrait: InGameStatsViewMobilePortrait(model),
    );
  }
}

