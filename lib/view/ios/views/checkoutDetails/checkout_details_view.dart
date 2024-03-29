import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/checkout_details_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'checkout_details_view_mobile_portrait.dart';

class CheckoutDetailsView extends StatefulWidget {
  @override
  _CheckoutDetailsViewState createState() => _CheckoutDetailsViewState();
}

class _CheckoutDetailsViewState extends State<CheckoutDetailsView> {
  final CheckoutDetailsViewModel model = CheckoutDetailsViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return View(
      mobilePortrait: CheckoutDetailsViewMobilePortrait(model),
    );
  }

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }
}
