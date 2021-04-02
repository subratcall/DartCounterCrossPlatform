import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/invites_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

class InvitesViewMobilePortrait extends StatelessWidget {

  final InvitesViewModel model;

  InvitesViewMobilePortrait(this.model);

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
