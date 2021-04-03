import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_counter/app_routes.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/model/profile.dart';
import 'package:dart_counter/view/ios/sharedWidgets/buttons/action_button.dart';
import 'package:dart_counter/view/ios/sharedWidgets/circle_image.dart';
import 'package:dart_counter/view/ios/views/loading_view.dart';
import 'package:dart_counter/view/ios/views/profile/widgets/stats_card.dart';
import 'package:dart_counter/viewmodel/profile_viewmodel.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileViewMobilePortrait extends StatelessWidget {
  final ProfileViewModel model;

  ProfileViewMobilePortrait(this.model);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ViewState>(
      initialData: ViewState.loading,
      builder: (context, snapshot) =>
      snapshot.data == ViewState.success ? StreamBuilder<Profile>(
              stream: model.outputProfile,
              builder: (context, snapshot) {
                Profile profile = snapshot.data;
                return Row(
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
                              flex: 234,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                child: Container(
                                    color: AppColors.black,
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Spacer(
                                            flex: 22,
                                          ),
                                          Expanded(
                                            child: Builder(
                                              builder: (context) =>
                                                  CupertinoButton(
                                                padding: EdgeInsets.zero,
                                                onPressed: () =>
                                                    showCupertinoModalPopup(
                                                  context: context,
                                                  builder: (context) =>
                                                      CupertinoActionSheet(
                                                    actions: [
                                                      CupertinoActionSheetAction(
                                                        child: Text(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .deletePhoto,
                                                          style: TextStyle(
                                                              color:
                                                                  CupertinoColors
                                                                      .systemRed),
                                                        ),
                                                        onPressed: () {
                                                          model
                                                              .onDeletePhotoPressed();
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                      CupertinoActionSheetAction(
                                                        child: Text(
                                                            AppLocalizations.of(
                                                                    context)
                                                                .takePhoto),
                                                        onPressed: () {
                                                          model
                                                              .onTakePhotoPressed();
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                      CupertinoActionSheetAction(
                                                        child: Text(
                                                            AppLocalizations.of(
                                                                    context)
                                                                .choosePhoto),
                                                        onPressed: () {
                                                          model
                                                              .onChoosePhotoPressed();
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ],
                                                    cancelButton:
                                                        CupertinoActionSheetAction(
                                                      child: Text(
                                                        AppLocalizations.of(
                                                                context)
                                                            .cancel,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                child: CircleImage(
                                                  profile.photoUrl != null
                                                      ? CachedNetworkImageProvider(
                                                          profile.photoUrl)
                                                      : AssetImage(AppImages
                                                          .photoPlaceholder),
                                                ),
                                              ),
                                            ),
                                            flex: 163,
                                          ),
                                          Spacer(
                                            flex: 17,
                                          ),
                                          AutoSizeText(
                                            profile.username,
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 23,
                                            ),
                                          ),
                                          Spacer(
                                            flex: 16,
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                            Spacer(
                              flex: 4,
                            ),
                            Expanded(
                              flex: 68,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                child: Container(
                                  color: AppColors.black,
                                  child: Row(
                                    children: [
                                      Spacer(),
                                      Center(
                                        child: AutoSizeText(
                                          AppLocalizations.of(context)
                                              .careerStats,
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 37,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Spacer(
                              flex: 4,
                            ),
                            Expanded(
                              flex: 275,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 178,
                                          child: StatsCard(
                                              title:
                                                  AppLocalizations.of(context)
                                                      .average,
                                              value:
                                                  profile?.careerStats?.average,
                                              trend: profile
                                                  ?.careerStats?.averageTrend),
                                        ),
                                        Spacer(
                                          flex: 4,
                                        ),
                                        Expanded(
                                          flex: 178,
                                          child: StatsCard(
                                              title:
                                                  AppLocalizations.of(context)
                                                      .checkoutPercentage,
                                              value: profile?.careerStats
                                                  ?.checkoutPercentage,
                                              trend: profile?.careerStats
                                                  ?.checkoutPercentageTrend),
                                        ),
                                      ],
                                    ),
                                    flex: 90,
                                  ),
                                  Spacer(
                                    flex: 4,
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 178,
                                          child: StatsCard(
                                              title:
                                                  AppLocalizations.of(context)
                                                      .firstNine,
                                              value: profile
                                                  ?.careerStats?.firstNine,
                                              trend: profile?.careerStats
                                                  ?.firstNineTrend),
                                        ),
                                        Spacer(
                                          flex: 4,
                                        ),
                                        Expanded(
                                          flex: 178,
                                          child: StatsCard(
                                              title:
                                                  AppLocalizations.of(context)
                                                      .games,
                                              value:
                                                  profile?.careerStats?.games),
                                        ),
                                      ],
                                    ),
                                    flex: 90,
                                  ),
                                  Spacer(
                                    flex: 4,
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 178,
                                          child: StatsCard(
                                              title:
                                                  AppLocalizations.of(context)
                                                      .wins,
                                              value:
                                                  profile?.careerStats?.wins),
                                        ),
                                        Spacer(
                                          flex: 4,
                                        ),
                                        Expanded(
                                          flex: 178,
                                          child: StatsCard(
                                              title:
                                                  AppLocalizations.of(context)
                                                      .defeats,
                                              value: profile
                                                  ?.careerStats?.defeats),
                                        ),
                                      ],
                                    ),
                                    flex: 90,
                                  ),
                                ],
                              ),
                            ),
                            Spacer(
                              flex: 12,
                            ),
                            Expanded(
                              flex: 75,
                              child: ActionButton(
                                text: AppLocalizations.of(context)
                                    .showGameHistory,
                                onPressed: () => Navigator.pushNamed(
                                    context, AppRoutes.gameHistory),
                              ),
                            ),
                            Spacer(
                              flex: 12,
                            ),
                          ],
                        )),
                    Spacer(
                      flex: 8,
                    ),
                  ],
                );
              })
          : snapshot.data == ViewState.error ? Center(
                  child: Text(AppLocalizations.of(context).errorLoadingProfile),
                )
          : LoadingView(),
    );
  }
}
