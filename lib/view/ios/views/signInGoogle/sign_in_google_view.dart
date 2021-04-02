import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/sign_in_google_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'sign_in_google_view_mobile_portrait.dart';

class SignInGoogleView extends StatelessWidget {

  final SignInGoogleViewModel model = SignInGoogleViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return View(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text(AppLocalizations.of(context).cancel),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        middle: Text('SignIn Google title - TODO'),
      ),
      mobilePortrait: SignInGoogleViewMobilePortrait(model),
    );
  }
}