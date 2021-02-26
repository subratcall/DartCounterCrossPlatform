import 'package:flutter/cupertino.dart';

class StatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(child: Text(this.toStringShort() + " -- IOS")),
    );
  }
}
