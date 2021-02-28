import 'package:dart_counter/viewmodel/settings_viewmodel.dart';
import 'package:dart_counter/view/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Screen<SettingsViewModel>(
      builder: (context, model, child) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(AppLocalizations.of(context).titleSettings),
          ),
          child: Center(child: Text(this.toStringShort() + " -- IOS")),
        );
      },
    );
  }
}
