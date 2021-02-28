import 'package:dart_counter/view/screen.dart';
import 'package:dart_counter/viewmodel/stats_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class StatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Screen<StatsViewModel>(builder: (context, model, child) {
      return CupertinoPageScaffold(
        child: Center(child: Text(this.toStringShort() + " -- IOS")),
      );
    });
  }
}
