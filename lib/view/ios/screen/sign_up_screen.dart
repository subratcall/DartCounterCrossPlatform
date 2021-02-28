import 'package:dart_counter/view/screen.dart';
import 'package:dart_counter/viewmodel/sign_up_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Screen<SignUpViewModel>(
        builder: (context, model, child) {
          return CupertinoPageScaffold(
            child: Center(child: Text(this.toStringShort() + " -- IOS")),
          );
        }
    );
  }
}