import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/app_routes.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/model/profile.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/ios/widgets/button/action_button.dart';
import 'package:dart_counter/view/ios/widgets/card.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/profile_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ProfileViewModel>(
      builder: (context, model, child) => View(
        navigationBar: CupertinoNavigationBar(
          middle: Text(AppLocalizations.of(context).profile),
        ),
        child: StreamBuilder(
          stream: model.profile(),
          builder: (context, snapshot) =>
              snapshot.hasData ? ProfileViewSuccess(snapshot.data) : ProfileViewError(),
        ),
      ),
    );
  }
}

class ProfileViewSuccess extends StatefulWidget {
  final Profile profile;

  ProfileViewSuccess(this.profile);

  @override
  _ProfileViewSuccessState createState() => _ProfileViewSuccessState();
}

class _ProfileViewSuccessState extends State<ProfileViewSuccess> {
  File image;

  @override
  Widget build(BuildContext context) {
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
                                flex: 13,
                              ),
                              Expanded(
                                child: CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () async {
                                    var pickedImage =
                                        await ImagePicker().getImage(source: ImageSource.gallery);
                                    setState(() {
                                      image = File(pickedImage.path);
                                    });
                                  },
                                  child: Container(
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: image == null ? DecorationImage(image: AssetImage(AppImages.photoPlaceholder)): DecorationImage(image: FileImage(image)),
                                    ),

                                  ),
                                ),
                                flex: 163,
                              ),
                              Spacer(
                                flex: 17,
                              ),
                              AutoSizeText(
                                widget.profile.username,
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
                                AppLocalizations.of(context).careerStats,
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
                        )),
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
                              child: StatsCard(
                                  title: AppLocalizations.of(context).average,
                                  value: widget.profile.carrerStats.average,
                                  trend: widget.profile.carrerStats.averageTrend),
                              flex: 178,
                            ),
                            Spacer(
                              flex: 4,
                            ),
                            Expanded(
                              child: StatsCard(
                                  title: AppLocalizations.of(context).checkoutPercentage,
                                  value: widget.profile.carrerStats.checkoutPercentage,
                                  trend: widget.profile.carrerStats.checkoutPercentageTrend),
                              flex: 178,
                            )
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
                              child: StatsCard(
                                  title: AppLocalizations.of(context).firstNine,
                                  value: widget.profile.carrerStats.firstNine,
                                  trend: widget.profile.carrerStats.firstNineTrend),
                              flex: 178,
                            ),
                            Spacer(
                              flex: 4,
                            ),
                            Expanded(
                              child: StatsCard(
                                  title: AppLocalizations.of(context).games,
                                  value: widget.profile.carrerStats.games),
                              flex: 178,
                            )
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
                              child: StatsCard(
                                  title: AppLocalizations.of(context).wins,
                                  value: widget.profile.carrerStats.wins),
                              flex: 178,
                            ),
                            Spacer(
                              flex: 4,
                            ),
                            Expanded(
                              child: StatsCard(
                                  title: AppLocalizations.of(context).defeats,
                                  value: widget.profile.carrerStats.defeats),
                              flex: 178,
                            )
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
                    text: AppLocalizations.of(context).showGameHistory,
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.gameHistory),
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
  }
}

// TODO
class ProfileViewError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppLocalizations.of(context).errorLoadingProfile),
    );
  }
}

// View specific widgets
class StatsCard extends StatelessWidget {
  final String title;
  final num value;
  final String trend;

  StatsCard({this.title, this.value, this.trend});

  @override
  Widget build(BuildContext context) {
    // TODO no hardcoded stuff
    return Card(
      middle: AutoSizeText(
        title,
        maxLines: 1,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
      ),
      body: Row(
        children: [
          Spacer(),
          Visibility(
              visible: trend != null,
              child: Row(
                children: [
                  Image.asset(
                    trend == 'up' ? AppImages.trendUp : AppImages.trendDown,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                ],
              )),
          AutoSizeText(
            value.toString(),
            maxLines: 1,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Spacer()
        ],
      ),
    );
  }
}
