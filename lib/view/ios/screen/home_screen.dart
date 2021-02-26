import 'package:dart_counter/app_language.dart';
import 'package:dart_counter/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, state, child) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(state.settings.language.settings),
          ),
          child: Center(child: Text(this.toStringShort() + " -- IOS")),
        );
      }
    );
  }
}
