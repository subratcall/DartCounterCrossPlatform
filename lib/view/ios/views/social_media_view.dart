import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/social_media_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SocialMediaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return View<SocialMediaViewModel>(builder: (context, model, child) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(CupertinoIcons.chevron_back, size: 35),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          middle: Text(AppLocalizations.of(context).socialMedia),
        ),
        child: Center(child: Text(this.toStringShort() + " -- IOS")),
      );
    });
  }
}
