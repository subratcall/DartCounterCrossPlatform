import 'package:dart_counter/viewmodel/sign_in_facebook_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class SignInFacebookViewMobilePortrait extends StatelessWidget {
  final SignInFacebookViewModel model;

  SignInFacebookViewMobilePortrait(this.model);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
      final double width = boxConstraints.maxWidth;
      final double height = boxConstraints.maxHeight;
      return Center(
        child: Text(this.toStringShort() + " -- IOS"),
      );
    });
  }
}
