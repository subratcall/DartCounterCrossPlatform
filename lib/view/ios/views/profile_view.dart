import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/app_routes.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/model/profile.dart';
import 'package:dart_counter/view/ios/views/loading_view.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/ios/widgets/button/action_button.dart';
import 'package:dart_counter/view/ios/widgets/card.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/profile_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ProfileViewModel>(
      builder: (context, model, child) => CupertinoView(
        padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 0),
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
        child: FutureBuilder(
          future: model.fetchProfile(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Profile profile = snapshot.data;
            return Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0),),
                    child: Container(
                      color: AppColors.black,
                      child: Column(
                        children: [
                          Image.asset(AppImages.photoPlaceholder),
                          SizedBox(height: 16,),
                          AutoSizeText(
                            profile.username,
                            maxLines: 1,
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  flex: 234,
                ),
                Spacer(
                  flex: 4,
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0),),
                    child: Container(
                      color: AppColors.black,
                      child: Column(
                        children: [
                          AutoSizeText(
                            'Karriere Statistiken',
                            maxLines: 1,
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 37,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  flex: 68,
                ),
                Spacer(
                  flex: 4,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: StatsCard(title: 'Average', value: profile.carrerStats.average, trend: profile.carrerStats.averageTrend),
                              flex: 178,
                            ),
                            Spacer(
                              flex: 4,
                            ),
                            Expanded(
                              child: StatsCard(title: 'Checkout%', value: profile.carrerStats.checkoutPercentage, trend: profile.carrerStats.checkoutPercentageTrend),
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
                              child: StatsCard(title: 'First 9', value: profile.carrerStats.firstNine, trend: profile.carrerStats.firstNineTrend),
                              flex: 178,
                            ),
                            Spacer(
                              flex: 4,
                            ),
                            Expanded(
                              child: StatsCard(title: 'Games', value: profile.carrerStats.games),
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
                              child: StatsCard(title: 'Wins', value: profile.carrerStats.wins),
                              flex: 178,
                            ),
                            Spacer(
                              flex: 4,
                            ),
                            Expanded(
                              child: StatsCard(title: 'Defeats', value: profile.carrerStats.defeats),
                              flex: 178,
                            )
                          ],
                        ),
                        flex: 90,
                      ),
                    ],
                  ),
                  flex: 275,
                ),
                Spacer(
                  flex: 12,
                ),
                Expanded(
                  child: ActionButton(
                    text: 'Last 10 Games',
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.gameHistory),
                  ),
                  flex: 75,
                ),
                Spacer(
                  flex: 12,
                ),
              ],
            );
          } else if (snapshot.hasError) {
            // TODO generic feedback eng, ger
            return Center(
              child: Text('No games found'),
            );
          } else {
            return LoadingView();
          }
        }),
      ),
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
    return Card(
      middle: AutoSizeText(
        title,
        maxLines: 1,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
      ),
      body: Row(
        children: [
          Expanded(
            child: Image.asset(
              trend == 'up' ? AppImages.trendUp : AppImages.trendDown,
            ),
          ),
          AutoSizeText(
            value.toString(),
            maxLines: 1,
            style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}