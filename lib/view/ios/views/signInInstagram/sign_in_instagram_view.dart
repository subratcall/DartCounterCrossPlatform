import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/sign_in_instagram_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'sign_in_instagram_view_mobile_portrait.dart';

class SignInInstagramView extends StatefulWidget {

  @override
  _SignInInstagramViewState createState() => _SignInInstagramViewState();
}

class _SignInInstagramViewState extends State<SignInInstagramView> {
  final SignInInstagramViewModel model = SignInInstagramViewModelImpl();

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
        middle: Text('SignIn Instagram title - TODO'),
      ),
      mobilePortrait: SignInInstagramViewMobilePortrait(model),
    );
  }

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }
}