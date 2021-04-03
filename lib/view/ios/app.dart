import 'package:dart_counter/app_model.dart';
import 'package:dart_counter/app_routes.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/model/user.dart';
import 'package:dart_counter/services/authentication_service.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'theme.dart';
import 'views/aboutUs/about_us_view.dart';
import 'views/createGame/create_game_view.dart';
import 'views/friends/friends_view.dart';
import 'views/gameHistory/game_history_view.dart';
import 'views/home/home_view.dart';
import 'views/inGame/in_game_view.dart';
import 'views/invites/invites_view.dart';
import 'views/loading_view.dart';
import 'views/postGame/post_game_view.dart';
import 'views/profile/profile_view.dart';
import 'views/settings/settings_view.dart';
import 'views/signIn/sign_in_view.dart';
import 'views/signUp/sign_up_view.dart';
import 'views/socialMedia/social_media_view.dart';

class DartCounterAppIOS extends StatelessWidget {
  final _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: DevicePreview.appBuilder,
      theme: Theme.theme,
      home: StreamBuilder<User>(
          stream: locator<AuthenticationService>().authStateChanged,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            final AppModel appModel = locator<AppModel>();
            final User user = snapshot.data;
            if (user != null) {
              appModel.uid = user.uid;
              return HomeView();
            } else {
              appModel.uid = null;
              return PageView(
                controller: _pageController,
                children: [
                  SignInView(_pageController),
                  SignUpView(_pageController),
                ],
              );
            }
          }),
      routes: {
        AppRoutes.loading: (context) => LoadingView(),
        AppRoutes.home: (context) => HomeView(),
        AppRoutes.profile: (context) => ProfileView(),
        AppRoutes.invite: (context) => InvitesView(),
        AppRoutes.gameHistory: (context) => GameHistoryView(),
        AppRoutes.friends: (context) => FriendsView(),
        AppRoutes.settings: (context) => SettingsView(),
        AppRoutes.aboutUs: (context) => AboutUsView(),
        AppRoutes.socialMedia: (context) => SocialMediaView(),
        AppRoutes.createGame: (context) => CreateGameView(),
        AppRoutes.inGame: (context) => InGameView(),
        AppRoutes.postGame: (context) => PostGameView(),
      },
    );
  }
}
