import 'package:dart_counter/app_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(builder: (contex, state, child) {
      return CupertinoPageScaffold(
        child: Center(child: Text(this.toStringShort() + " -- IOS")),
      );
    });
  }
}
