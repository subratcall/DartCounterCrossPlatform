import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/profile_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return View<ProfileViewModel>(builder: (context, model, child) {
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
                  child: Placeholder(),
                  flex: 234,
                ),
                Spacer(
                  flex: 4,
                ),
                Expanded(
                  child: Placeholder(),
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
                              child: Placeholder(),
                            ),
                            Expanded(
                              child: Placeholder(),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Placeholder(),
                            ),
                            Expanded(
                              child: Placeholder(),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Placeholder(),
                            ),
                            Expanded(
                              child: Placeholder(),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  flex: 275,
                ),
                Spacer(
                  flex: 12,
                ),
                Expanded(
                  child: Placeholder(),
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

// View specific widgets
class StatsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

/**
    ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    child: Container(
    color: AppColors.black,
    child: Column(
    children: [
    Image.asset(AppImages.photoPlaceholder),
    SizedBox(height: 16,),
    AutoSizeText(
    'Spielername',
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
*/

/**
    ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
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
    )
*/

/**
    ActionButton(
    text: 'Last 10 Games',
    onPressed: () =>
    Navigator.pushNamed(context, AppRoutes.gameHistory),
    )
*/