import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/ios/widgets/stats.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/stats_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class InGameStatsView extends StatelessWidget {

  final Game game;

  InGameStatsView(this.game);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<StatsViewModel>(
      builder: (context, model, child) => View(
          child: Column(
        children: [
          Spacer(
            flex: 50,
          ),
          Expanded(
            flex: 500,
            child: Row(
              children: [
                Spacer(
                  flex: 8,
                ),
                Expanded(
                  flex: 359,
                  child: Stats(game.players),
                ),
                Spacer(
                  flex: 8,
                ),
              ],
            ),
          ),
          Spacer(
            flex: 31,
          ),
          Expanded(
            flex: 80,
            child: Image.asset(AppImages.adBanner),
          ),
          Spacer(
            flex: 26,
          ),
        ],
      )),
    );
  }
}
