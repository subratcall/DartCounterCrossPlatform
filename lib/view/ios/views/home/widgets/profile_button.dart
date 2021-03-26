import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_counter/app_routes.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/model/profile.dart';
import 'package:dart_counter/view/ios/sharedWidgets/buttons/primary_button.dart';
import 'package:dart_counter/view/ios/sharedWidgets/circle_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileButton extends StatelessWidget {
  final Stream<Profile> profiles;

  ProfileButton(this.profiles);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Profile>(
        stream: profiles,
        builder: (context, snapshot) {
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
                    profile?.photoUrl != null
                        ? CachedNetworkImageProvider(profile.photoUrl)
                        : AssetImage(AppImages.photoPlaceholder),
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
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white),
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
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white),
                            ),
                            Spacer(),
                            AutoSizeText(
                              profile?.careerStats?.average?.toString() ?? '--',
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Flexible(
                        child: Row(
                          children: [
                            AutoSizeText(
                              AppLocalizations.of(context).checkoutPercentage +
                                  ':',
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white),
                            ),
                            Spacer(),
                            AutoSizeText(
                              profile?.careerStats?.checkoutPercentage
                                      ?.toString() ??
                                  '--',
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white),
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
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white),
                            ),
                            Spacer(),
                            AutoSizeText(
                              profile?.careerStats?.wins?.toString() ?? '--',
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white),
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
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white),
                            ),
                            Spacer(),
                            AutoSizeText(
                              profile?.careerStats?.defeats?.toString() ?? '--',
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white),
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
        });
  }
}
