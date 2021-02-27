import 'package:dart_counter/app_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CheckoutDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(builder: (context, state, child) {
      return CupertinoPageScaffold(
        child: Center(child: Text(this.toStringShort() + " -- IOS")),
      );
    });
  }
}
