import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/friends_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FriendsView extends StatelessWidget {

  final FriendsViewModel model = FriendsViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return View(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context).friends),
      ),
      mobilePortrait: FriendsViewMobilePortrait(model),
    );
  }
}

class FriendsViewMobilePortrait extends StatelessWidget {

  final FriendsViewModel model;

  FriendsViewMobilePortrait(this.model);

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
