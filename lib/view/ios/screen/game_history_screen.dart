import 'package:flutter/cupertino.dart';

class GameHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(child: Text(this.toStringShort() + " -- IOS")),
    );
  }
}
