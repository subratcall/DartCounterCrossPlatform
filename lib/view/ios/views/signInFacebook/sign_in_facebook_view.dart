import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/sign_in_facebook_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'sign_in_facebook_view_mobile_portrait.dart';

class SignInFacebookView extends StatefulWidget {

  @override
  _SignInFacebookViewState createState() => _SignInFacebookViewState();
}

class _SignInFacebookViewState extends State<SignInFacebookView> {
  final SignInFacebookViewModel model = SignInFacebookViewModelImpl();

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
        middle: Text('SignIn facebook title - TODO'),
      ),
      mobilePortrait: SignInFacebookViewMobilePortrait(model),
    );
  }

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }
}