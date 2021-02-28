import 'package:dart_counter/view/screen.dart';
import 'package:dart_counter/viewmodel/authentication/reset_password_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Screen<ResetPasswordViewModel>(builder: (context, model, child) {
      return CupertinoPageScaffold(
        child: Center(child: Text(this.toStringShort() + " -- IOS")),
      );
    });
  }
}
