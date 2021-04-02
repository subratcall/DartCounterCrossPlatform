import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/invites_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'invites_view_mobile_portrait.dart';

class InvitesView extends StatelessWidget {

  final InvitesViewModel model = InvitesViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return View(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context).invites),
      ),
      mobilePortrait: InvitesViewMobilePortrait(model),
    );
  }
}


