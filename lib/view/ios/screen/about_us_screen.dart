import 'package:dart_counter/view/screen.dart';
import 'package:dart_counter/viewmodel/about_us_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Screen<AboutUsViewModel>(builder: (context, model, child) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(CupertinoIcons.chevron_back, size: 35),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          middle: Text(AppLocalizations.of(context).aboutUs),
        ),
        child: Center(child: Text(this.toStringShort() + " -- IOS")),
      );
    });
  }
}
