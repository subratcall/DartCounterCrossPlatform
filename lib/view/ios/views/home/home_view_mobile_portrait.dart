import 'package:dart_counter/app_routes.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/assets/app_paddings.dart';
import 'package:dart_counter/viewmodel/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';

import 'widgets/friends_button.dart';
import 'widgets/invites_button.dart';
import 'widgets/play_offline_button.dart';
import 'widgets/play_online_button.dart';
import 'widgets/profile_button.dart';
import 'widgets/settings_button.dart';
import 'widgets/social_media_button.dart';

class HomeViewMobilePortrait extends StatelessWidget {

  final HomeViewModel model;

  HomeViewMobilePortrait(this.model);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints boxConstraints) {
        return Padding(
          padding: EdgeInsets.all(AppPaddings.small),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: ProfileButton(
                  profileStream: model.outputProfile,
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.profile),
                ),
              ),
              SizedBox(
                height: AppPaddings.small,
              ),
              Expanded(
                flex: 3,
                child: PlayOnlineButton(
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.createGame),
                ),
              ),
              SizedBox(
                height: AppPaddings.small,
              ),
              Expanded(
                flex: 3,
                child: PlayOfflineButton(
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.createGame),
                ),
              ),
              SizedBox(
                height: AppPaddings.small,
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      child: InvitesButton(
                        newInvitesStream: model.outputNewInvites,
                        onPressed: () => Navigator.pushNamed(context, AppRoutes.invite),
                      ),
                    ),
                    SizedBox(
                      width: AppPaddings.small,
                    ),
                    Expanded(
                      child: FriendsButton(
                        newFriendRequestStream: model.outputNewFriendRequests,
                        onPressed: () => Navigator.pushNamed(context, AppRoutes.friends),
                      ),
                    ),
                  ],
                )
              ),
              SizedBox(
                height: AppPaddings.small,
              ),
              Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Expanded(
                        child: SocialMediaButton(
                          onPressed: () => Navigator.pushNamed(context, AppRoutes.socialMedia),
                        ),
                      ),
                      SizedBox(
                        width: AppPaddings.small,
                      ),
                      Expanded(
                        child: SettingsButton(
                          onPressed: () => Navigator.pushNamed(context, AppRoutes.settings)
                        ),
                      ),
                    ],
                  )
              ),
              SizedBox(
                height: AppPaddings.medium,
              ),
              Expanded(
                flex: 2,
                child: Image.asset(AppImages.adBanner),
              ),
            ],
          ),
        );
      }
    );
  }
}



