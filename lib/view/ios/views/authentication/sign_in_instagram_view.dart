import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/authentication/sign_in_instagram_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class SignInInstagramView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignInInstagramViewModel>(builder: (context, model, child) {
      return View(
        child: Text(this.toStringShort() + " -- IOS"),
      );
    });
  }
}
