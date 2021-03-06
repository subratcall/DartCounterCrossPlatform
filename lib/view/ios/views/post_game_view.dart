import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/invites_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PostGameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<InvitesViewModel>(
      builder: (context, model, child) => View(
        navigationBar: CupertinoNavigationBar(
          middle: Text('TODO'),
        ),
        child: Center(
          child: Text(this.toStringShort() + " -- IOS"),
        ),
      ),
    );
  }
}
