import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_counter/app_routes.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_icons.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/model/profile.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/ios/widgets/button/primary_button.dart';
import 'package:dart_counter/view/ios/widgets/circle_image.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                    child: ProfileButton(model.profile()),
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
                  Expanded(
                    flex: 116,
                    child: PlayOfflineButton(),
                  ),
                  Spacer(
                    flex: 4,
                  ),
                  Expanded(
                    flex: 116,
                    child: Row(
                      children: [
                        Expanded(
                          child: InvitesButton(),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
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
                          child: SocialMediaButton(),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: SettingsButton(),
                        ),
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

class ProfileButton extends StatelessWidget {
  final Stream<Profile> profiles;

  ProfileButton(this.profiles);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: profiles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Profile profile = snapshot.data;
            return PrimaryButton(
              child: Row(
                children: [
                  Spacer(
                    flex: 14,
                  ),
                  Expanded(
                    flex: 100,
                    child: CircleImage(
                      profile.photoUrl != null
                          ? DecorationImage(
                              image: CachedNetworkImageProvider(profile.photoUrl),
                            )
                          : DecorationImage(
                              image: AssetImage(AppImages.photoPlaceholder),
                            ),
                    ),
                  ),
                  Spacer(
                    flex: 50,
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                profile?.username ?? '--',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold, color: AppColors.white),
                              ),
                            ],
                          ),
                          flex: 2,
                        ),
                        Spacer(),
                        Flexible(
                          child: Row(
                            children: [
                              AutoSizeText(
                                AppLocalizations.of(context).average + ':',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
                              ),
                              Spacer(),
                              AutoSizeText(
                                profile?.carrerStats?.average?.toString() ?? '--',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Flexible(
                          child: Row(
                            children: [
                              AutoSizeText(
                                AppLocalizations.of(context).checkoutPercentage + ':',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
                              ),
                              Spacer(),
                              AutoSizeText(
                                profile?.carrerStats?.checkoutPercentage?.toString() ?? '--',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Flexible(
                          child: Row(
                            children: [
                              AutoSizeText(
                                AppLocalizations.of(context).wins + ':',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
                              ),
                              Spacer(),
                              AutoSizeText(
                                profile?.carrerStats?.wins?.toString() ?? '--',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Flexible(
                          child: Row(
                            children: [
                              AutoSizeText(
                                AppLocalizations.of(context).defeats + ':',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
                              ),
                              Spacer(),
                              AutoSizeText(
                                profile?.carrerStats?.defeats?.toString() ?? '--',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    flex: 155,
                  ),
                  Spacer(
                    flex: 60,
                  ),
                ],
              ),
              onPressed: () => Navigator.pushNamed(context, AppRoutes.profile),
            );
          } else {
            return PrimaryButton(
              child: Row(
                children: [
                  Spacer(
                    flex: 14,
                  ),
                  Spacer(
                    flex: 50,
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                '--',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold, color: AppColors.white),
                              ),
                            ],
                          ),
                          flex: 2,
                        ),
                        Spacer(),
                        Flexible(
                          child: Row(
                            children: [
                              AutoSizeText(
                                AppLocalizations.of(context).average + ':',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
                              ),
                              Spacer(),
                              AutoSizeText(
                                '--',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Flexible(
                          child: Row(
                            children: [
                              AutoSizeText(
                                AppLocalizations.of(context).checkoutPercentage + ':',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
                              ),
                              Spacer(),
                              AutoSizeText(
                                '--',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Flexible(
                          child: Row(
                            children: [
                              AutoSizeText(
                                AppLocalizations.of(context).wins + ':',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
                              ),
                              Spacer(),
                              AutoSizeText(
                                '--',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Flexible(
                          child: Row(
                            children: [
                              AutoSizeText(
                                AppLocalizations.of(context).defeats + ':',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
                              ),
                              Spacer(),
                              AutoSizeText(
                                '--',
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    flex: 155,
                  ),
                  Spacer(
                    flex: 60,
                  ),
                ],
              ),
              onPressed: () => Navigator.pushNamed(context, AppRoutes.profile),
            );
          }
        });
  }
}

class PlayOnlineButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      child: Row(
        children: [
          Spacer(
            flex: 14,
          ),
          Image.asset(AppImages.target),
          Spacer(
            flex: 25,
          ),
          Flexible(
            child: Column(
              children: [
                Spacer(),
                AutoSizeText(
                  AppLocalizations.of(context).offline.toUpperCase(),
                  maxLines: 1,
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: AppColors.white),
                ),
                AutoSizeText(
                  AppLocalizations.of(context).play.toUpperCase(),
                  maxLines: 1,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: AppColors.red),
                ),
                Spacer(),
              ],
            ),
            flex: 193,
          ),
          Spacer(
            flex: 14,
          ),
        ],
      ),
      onPressed: () => Navigator.pushNamed(context, AppRoutes.createGame),
    );
  }
}

class PlayOfflineButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      child: Row(
        children: [
          Spacer(
            flex: 14,
          ),
          Image.asset(AppImages.target),
          Spacer(
            flex: 25,
          ),
          Flexible(
            child: Column(
              children: [
                Spacer(),
                AutoSizeText(
                  AppLocalizations.of(context).online.toUpperCase(),
                  maxLines: 1,
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: AppColors.white),
                ),
                AutoSizeText(
                  AppLocalizations.of(context).play.toUpperCase(),
                  maxLines: 1,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: AppColors.yellow),
                ),
                Spacer(),
              ],
            ),
            flex: 193,
          ),
          Spacer(
            flex: 14,
          ),
        ],
      ),
      onPressed: () => Navigator.pushNamed(context, AppRoutes.createGame),
    );
  }
}

class InvitesButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      child: Column(
        children: [
          Spacer(),
          Icon(
            AppIcons.mail,
            size: 50,
            color: AppColors.white,
          ),
          Spacer(),
          AutoSizeText(
            AppLocalizations.of(context).invitations.toUpperCase(),
            maxLines: 1,
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: AppColors.white),
          ),
          Spacer(),
        ],
      ),
      onPressed: () => Navigator.pushNamed(context, AppRoutes.invite),
    );
  }
}

class FriendsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      child: Column(
        children: [
          Spacer(),
          Icon(
            AppIcons.users,
            size: 50,
            color: AppColors.white,
          ),
          Spacer(),
          AutoSizeText(
            AppLocalizations.of(context).friends.toUpperCase(),
            maxLines: 1,
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: AppColors.white),
          ),
          Spacer(),
        ],
      ),
      onPressed: () => Navigator.pushNamed(context, AppRoutes.friends),
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      child: Column(
        children: [
          Spacer(),
          Padding(
              padding: const EdgeInsets.all(7.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    AppIcons.facebook,
                    size: 35,
                    color: AppColors.white,
                  ),
                  Icon(
                    AppIcons.instagram,
                    size: 35,
                    color: AppColors.white,
                  ),
                  Icon(
                    AppIcons.youtube,
                    size: 35,
                    color: AppColors.white,
                  ),
                ],
              )),
          Spacer(),
          AutoSizeText(
            AppLocalizations.of(context).socialMedia.toUpperCase(),
            maxLines: 1,
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: AppColors.white),
          ),
          Spacer(),
        ],
      ),
      onPressed: () => Navigator.pushNamed(context, AppRoutes.socialMedia),
    );
  }
}

class SettingsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      child: Column(
        children: [
          Spacer(),
          Icon(
            CupertinoIcons.settings,
            size: 50,
            color: AppColors.white,
          ),
          Spacer(),
          AutoSizeText(
            AppLocalizations.of(context).settings.toUpperCase(),
            maxLines: 1,
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: AppColors.white),
          ),
          Spacer(),
        ],
      ),
      onPressed: () => Navigator.pushNamed(context, AppRoutes.settings),
    );
  }
}
