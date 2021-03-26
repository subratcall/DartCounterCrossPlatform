import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'widgets/friends_button.dart';
import 'widgets/invites_button.dart';
import 'widgets/play_offline_button.dart';
import 'widgets/play_online_button.dart';
import 'widgets/profile_button.dart';
import 'widgets/settings_button.dart';
import 'widgets/social_media_button.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>(
      builder: (context, model, child) => View(
        navigationBar: CupertinoNavigationBar(
          middle: Text(AppLocalizations.of(context).home),
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(
              CupertinoIcons.square_arrow_right,
              size: 35,
              color: AppColors.black,
            ),
            onPressed: () => model.onSignOutPressed(),
          ),
        ),
        child: Row(
          children: [
            Spacer(
              flex: 8,
            ),
            Expanded(
              flex: 359,
              child: Column(
                children: [
                  Spacer(
                    flex: 4,
                  ),
                  Expanded(
                    flex: 116,
                    child: ProfileButton(
                      model.profile(),
                    ),
                  ),
                  Spacer(
                    flex: 4,
                  ),
                  Expanded(
                    flex: 116,
                    child: PlayOnlineButton(),
                  ),
                  Spacer(
                    flex: 4,
                  ),
                  Expanded(flex: 116, child: PlayOfflineButton()),
                  Spacer(
                    flex: 4,
                  ),
                  Expanded(
                    flex: 116,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 177,
                          child: InvitesButton(),
                        ),
                        Spacer(
                          flex: 4,
                        ),
                        Expanded(
                          flex: 177,
                          child: FriendsButton(),
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 4,
                  ),
                  Expanded(
                    flex: 116,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 177,
                          child: SocialMediaButton(),
                        ),
                        Spacer(
                          flex: 4,
                        ),
                        Expanded(flex: 177, child: SettingsButton()),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 4,
                  ),
                  Expanded(
                    flex: 82,
                    child: Image.asset(AppImages.adBanner),
                  ),
                  Spacer(
                    flex: 4,
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 8,
            ),
          ],
        ),
      ),
    );
  }
}
