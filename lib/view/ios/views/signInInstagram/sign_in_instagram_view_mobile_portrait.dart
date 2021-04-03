import 'package:dart_counter/viewmodel/sign_in_instagram_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class SignInInstagramViewMobilePortrait extends StatelessWidget {
  final SignInInstagramViewModel model;

  SignInInstagramViewMobilePortrait(this.model);

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
