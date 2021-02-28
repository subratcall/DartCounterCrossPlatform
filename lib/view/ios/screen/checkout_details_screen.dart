import 'package:dart_counter/view/screen.dart';
import 'package:dart_counter/viewmodel/checkout_details_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class CheckoutDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Screen<CheckoutDetailsViewModel>(builder: (context, model, child) {
      return CupertinoPageScaffold(
        child: Center(child: Text(this.toStringShort() + " -- IOS")),
      );
    });
  }
}
