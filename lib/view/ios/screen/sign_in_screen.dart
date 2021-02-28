import 'package:dart_counter/view/screen.dart';
import 'package:dart_counter/viewmodel/sign_in_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Screen<SignInViewModel>(
        builder: (context, model, child) {
          return CupertinoPageScaffold(
            child: SafeArea(
              child: Center(
                  child: Column(
                    children: [
                      Text(this.toStringShort() + " -- IOS"),
                      CupertinoButton(child: Text("Press me"), onPressed: () {})
                    ],
                  )
              ),
            ),
          );
        }
    );
  }
}
