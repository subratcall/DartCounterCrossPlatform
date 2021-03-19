import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/model/snapshots/player_snapshot.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/ios/widgets/stats.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/stats_viewmodel.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';

class InGameStatsView extends StatelessWidget {
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
                  child: Stats(RandomGenerator().amount((i) => PlayerSnapshot.seed(false), 4).cast<PlayerSnapshot>().toList()),
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
