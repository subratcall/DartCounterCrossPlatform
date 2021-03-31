import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/settings_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsView extends StatelessWidget {

  final SettingsViewModel model = SettingsViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return View2(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context).settings),
      ),
      mobilePortrait: SettingsViewMobilePortrait(model),
    );
  }
}

class SettingsViewMobilePortrait extends StatelessWidget {

  final SettingsViewModel model;

  SettingsViewMobilePortrait(this.model);

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