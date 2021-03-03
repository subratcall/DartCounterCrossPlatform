import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/social_media_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SocialMediaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SocialMediaViewModel>(
      builder: (context, model, child) => CupertinoView(
        navigationBar: CupertinoNavigationBar(
          middle: Text(AppLocalizations.of(context).socialMedia),
        ),
        child: Center(
          child: Text(this.toStringShort() + " -- IOS"),
        ),
      ),
    );
  }
}
