import 'package:dart_counter/viewmodel/social_media_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class SocialMediaViewMobilePortrait extends StatelessWidget {

  final SocialMediaViewModel model;

  SocialMediaViewMobilePortrait(this.model);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
          final double width = boxConstraints.maxWidth;
          final double height = boxConstraints.maxHeight;
          return Center(
            child: Text(this.toStringShort() + " -- IOS"),
          );
        }
    );
  }
}