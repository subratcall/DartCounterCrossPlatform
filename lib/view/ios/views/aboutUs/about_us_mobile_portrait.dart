import 'package:dart_counter/viewmodel/about_us_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class AboutUsViewMobilePortrait extends StatelessWidget {
  final AboutUsViewModel model;

  AboutUsViewMobilePortrait(this.model);

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
