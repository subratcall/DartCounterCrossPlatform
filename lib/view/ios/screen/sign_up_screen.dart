import 'package:flutter/cupertino.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(child: Text(this.toStringShort() + " -- IOS")),
    );
  }
}
