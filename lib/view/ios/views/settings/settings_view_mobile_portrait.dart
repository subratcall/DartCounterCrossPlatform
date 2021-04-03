import 'package:dart_counter/viewmodel/settings_viewmodel.dart';
import 'package:flutter/cupertino.dart';

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
    });
  }
}
