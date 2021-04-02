import 'package:dart_counter/view/ios/views/view.dart';

import 'package:dart_counter/viewmodel/social_media_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SocialMediaView extends StatelessWidget {

  final SocialMediaViewModel model = SocialMediaViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return View(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context).socialMedia),
      ),
      mobilePortrait: SocialMediaViewMobilePortrait(model),
    );
  }
}

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
