import 'package:dart_counter/view/ios/views/loading_view.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/reset_password_viewmodel.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'mobilePortrait/reset_password_view_mobile_portrait_idle.dart';
import 'mobilePortrait/reset_password_view_mobile_portrait_success.dart';

class ResetPasswordView extends StatefulWidget {
  @override
  _ResetPasswordViewState createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final ResetPasswordViewModel model = ResetPasswordViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ViewState>(
        initialData: ViewState.idle,
        stream: model.outputViewState,
        builder: (context, snapshot) => snapshot.data == ViewState.idle
            ? View(
                navigationBar: CupertinoNavigationBar(
                  leading: CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Text(AppLocalizations.of(context).cancel),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  middle: Text(AppLocalizations.of(context).resetPassword),
                ),
                mobilePortrait: ResetPasswordViewMobilePortraitIdle(model),
              )
            : snapshot.data == ViewState.success
                ? View(
                    mobilePortrait: ResetPasswordViewMobilePortraitSuccess(),
                  )
                : LoadingView());
  }

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }
}
