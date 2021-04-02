import 'package:dart_counter/view/ios/views/loading_view.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/profile_viewmodel.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'mobilePortrait/profile_view_mobile_portrait_error.dart';
import 'mobilePortrait/profile_view_mobile_portrait_success.dart';

class ProfileView extends StatelessWidget {
  final ProfileViewModel model = ProfileViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ViewState>(
        initialData: ViewState.idle,
        builder: (context, snapshot) => snapshot.data == ViewState.success
            ? View(
                navigationBar: CupertinoNavigationBar(
                  middle: Text(AppLocalizations.of(context).profile),
                ),
                mobilePortrait: ProfileViewMobilePortraitSuccess(model),
              )
            : snapshot.data == ViewState.error
                ? View(
                    mobilePortrait: ProfileViewMobilePortraitError(),
                  )
                : LoadingView());
  }
}
