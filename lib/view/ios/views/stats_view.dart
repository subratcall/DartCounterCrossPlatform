import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/stats_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class StatsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return View<StatsViewModel>(builder: (context, model, child) {
      return CupertinoPageScaffold(
        child: Center(child: Text(this.toStringShort() + " -- IOS")),
      );
    });
  }
}
