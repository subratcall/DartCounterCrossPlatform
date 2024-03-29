import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/about_us_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'about_us_mobile_portrait.dart';

class AboutUsView extends StatefulWidget {
  @override
  _AboutUsViewState createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  final AboutUsViewModel model = AboutUsViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return View(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context).aboutUs),
      ),
      mobilePortrait: AboutUsViewMobilePortrait(model),
    );
  }

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }
}
