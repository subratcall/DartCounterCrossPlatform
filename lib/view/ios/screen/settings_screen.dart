import 'package:flutter/cupertino.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Einstellungen'),
      ),
      child: Center(child: Text(this.toStringShort() + " -- IOS")),
    );
  }
}
