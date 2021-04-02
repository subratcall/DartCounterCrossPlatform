import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/sign_in_google_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

class SignInGoogleViewMobilePortrait extends StatelessWidget {

  final SignInGoogleViewModel model;

  SignInGoogleViewMobilePortrait(this.model);

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
