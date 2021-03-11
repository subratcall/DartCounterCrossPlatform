import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/stats_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class InGameStatsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<StatsViewModel>(
      builder: (context, model, child) => View(
        child: Center(
          child: Text(this.toStringShort() + " -- IOS"),
        ),
      ),
    );
  }
}
