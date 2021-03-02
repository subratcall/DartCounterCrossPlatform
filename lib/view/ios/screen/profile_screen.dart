import 'package:dart_counter/app_routes.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/view/ios/widget/button/action_button.dart';
import 'package:dart_counter/view/screen.dart';
import 'package:dart_counter/viewmodel/profile_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Screen<ProfileViewModel>(builder: (context, model, child) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(CupertinoIcons.chevron_back, size: 35),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          middle: Text(AppLocalizations.of(context).profile),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 0),
            child: Column(
              children: [
                Spacer(
                  flex: 4,
                ),
                Expanded(
                  child: Container(
                    color: AppColors.red,
                  ),
                  flex: 234,
                ),
                Spacer(
                  flex: 4,
                ),
                Expanded(
                  child: Container(
                    color: AppColors.red,
                  ),
                  flex: 68,
                ),
                Spacer(
                  flex: 4,
                ),
                Expanded(
                  child: Container(
                    color: AppColors.red,
                  ),
                  flex: 275,
                ),
                Spacer(
                  flex: 12,
                ),
                Expanded(
                  child: ActionButton(
                    text: 'Last 10 Games',
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.gameHistory),
                  ),
                  flex: 75,
                ),
                Spacer(
                  flex: 22,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

// Screen specific widgets

