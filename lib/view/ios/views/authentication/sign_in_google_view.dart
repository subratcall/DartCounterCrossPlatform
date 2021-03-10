import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/authentication/sign_in_google_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class SignInGoogleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignInGoogleViewModel>(builder: (context, model, child) {
      return View(
        child: Text(this.toStringShort() + " -- IOS"),
      );
    });
  }
}
