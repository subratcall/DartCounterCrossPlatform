import 'package:dart_counter/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CheckoutDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, state, child) {
      return CupertinoPageScaffold(
        child: Center(child: Text(this.toStringShort() + " -- IOS")),
      );
    });
  }
}
