import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/checkout_details_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class CheckoutDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return View<CheckoutDetailsViewModel>(builder: (context, model, child) {
      return CupertinoPageScaffold(
        child: Center(child: Text(this.toStringShort() + " -- IOS")),
      );
    });
  }
}
