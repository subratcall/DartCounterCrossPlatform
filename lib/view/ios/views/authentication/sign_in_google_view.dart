import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/authentication/sign_in_google_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInGoogleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignInGoogleViewModel>(builder: (context, model, child) {
      return View(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Text(AppLocalizations.of(context).cancel),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          middle: Text('SignIn google title - TODO'),
        ),
        child: Center(child: Text(this.toStringShort() + " -- IOS")),
      );
    });
  }
}
