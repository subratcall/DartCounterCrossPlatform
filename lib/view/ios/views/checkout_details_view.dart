import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/checkout_details_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class CheckoutDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CheckoutDetailsViewModel>(
      builder: (context, model, child) => CupertinoView(
        child: Center(
          child: Text(this.toStringShort() + " -- IOS"),
        ),
      ),
    );
  }
}
