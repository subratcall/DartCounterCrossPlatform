import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/social_media_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'social_media_view_mobile_portrait.dart';

class SocialMediaView extends StatefulWidget {

  @override
  _SocialMediaViewState createState() => _SocialMediaViewState();
}

class _SocialMediaViewState extends State<SocialMediaView> {
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

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }
}