import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileViewMobilePortraitError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppLocalizations.of(context).errorLoadingProfile),
    );
  }
}