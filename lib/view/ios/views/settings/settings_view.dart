import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/settings_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'settings_view_mobile_portrait.dart';

class SettingsView extends StatelessWidget {

  final SettingsViewModel model = SettingsViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return View(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context).settings),
      ),
      mobilePortrait: SettingsViewMobilePortrait(model),
    );
  }
}