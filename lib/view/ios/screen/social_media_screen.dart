import 'package:dart_counter/view/screen.dart';
import 'package:dart_counter/viewmodel/social_media_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SocialMediaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Screen<SocialMediaViewModel>(
        builder: (context, model, child) {
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              leading: CupertinoButton(
                padding: EdgeInsets.zero,
                child: Icon(CupertinoIcons.chevron_back, size: 35),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              middle: Text(AppLocalizations.of(context).titleSocialMedia),
            ),
            child: Center(child: Text(this.toStringShort() + " -- IOS")),
          );
        }
    );
  }
}
