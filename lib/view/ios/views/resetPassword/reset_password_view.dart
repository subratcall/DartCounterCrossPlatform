import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/app_errors.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/view/ios/sharedWidgets/buttons/link_button.dart';
import 'package:dart_counter/view/ios/sharedWidgets/buttons/primary_text_button.dart';
import 'package:dart_counter/view/ios/sharedWidgets/textfield.dart';
import 'package:dart_counter/view/ios/views/loading_view.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/toast.dart';
import 'package:dart_counter/viewmodel/reset_password_viewmodel.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordView extends StatelessWidget {
  final ResetPasswordViewModel model = ResetPasswordViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ViewState>(
        initialData: ViewState.idle,
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
}

class ResetPasswordViewMobilePortraitIdle extends StatelessWidget {
  final ResetPasswordViewModel model;

  ResetPasswordViewMobilePortraitIdle(this.model);

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints boxConstraints) {
        final double width = boxConstraints.maxWidth;
        final double height = boxConstraints.maxHeight;
        return SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: width,
              maxHeight: height,
            ),
            child: Row(
              children: [
                Spacer(
                  flex: 38,
                ),
                Expanded(
                  flex: 299,
                  child: Column(
                    children: [
                      Spacer(
                        flex: 105,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Spacer(
                              flex: 120,
                            ),
                            Flexible(
                              child: Image.asset(AppImages.logo),
                              flex: 135,
                            ),
                            Spacer(
                              flex: 120,
                            ),
                          ],
                        ),
                        flex: 166,
                      ),
                      Spacer(
                        flex: 67,
                      ),
                      Expanded(
                        child: AutoSizeText(
                          AppLocalizations.of(context).forgotPassword,
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23),
                        ),
                        flex: 21,
                      ),
                      Spacer(
                        flex: 28,
                      ),
                      Expanded(
                        child: AutoSizeText(
                          AppLocalizations.of(context)
                              .insertEmailToResetPassword,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                          maxLines: 2,
                        ),
                        flex: 32,
                      ),
                      Spacer(
                        flex: 28,
                      ),
                      Expanded(
                        child: TextField(
                          outputText: model.inputEmail,
                          placeholder: AppLocalizations.of(context).email,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          onEditingComplete: () => node.unfocus(),
                        ),
                        flex: 36,
                      ),
                      Spacer(
                        flex: 47,
                      ),
                      Expanded(
                        child: PrimaryTextButton(
                          initialIsEnabled: false,
                          inputIsEnabled: model.outputIsConfirmButtonEnabled,
                          text: AppLocalizations.of(context).confirm,
                          onPressed: () {
                            // TODO this is only a workaround find a better solution for this e.g with global key
                            var errorMessages = {
                              'errorInvalidEmailAddress':
                                  AppLocalizations.of(context)
                                      .errorInvalidEmailAddress,
                              'errorNetwork':
                                  AppLocalizations.of(context).errorNetwork,
                            };

                            model.onConfirmPressed().catchError((error) {
                              if (error is InvalidEmailAddressError) {
                                Toast.showToast(
                                    errorMessages['errorInvalidEmailAddress']);
                              } else {
                                Toast.showToast(errorMessages['errorNetwork']);
                              }
                            });
                          },
                        ),
                        flex: 50,
                      ),
                      Spacer(
                        flex: 158,
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 38,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ResetPasswordViewMobilePortraitSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints boxConstraints) {
        final double width = boxConstraints.maxWidth;
        final double height = boxConstraints.maxHeight;
        return Row(
          children: [
            Spacer(
              flex: 38,
            ),
            Expanded(
              flex: 299,
              child: Column(
                children: [
                  Spacer(
                    flex: 105,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Spacer(
                          flex: 120,
                        ),
                        Flexible(
                          child: Image.asset(AppImages.logo),
                          flex: 135,
                        ),
                        Spacer(
                          flex: 120,
                        ),
                      ],
                    ),
                    flex: 166,
                  ),
                  Spacer(
                    flex: 64,
                  ),
                  Expanded(
                    child: Icon(
                      CupertinoIcons.checkmark_alt_circle,
                      color: AppColors.green,
                      size: 60,
                    ),
                    flex: 44,
                  ),
                  Spacer(
                    flex: 22,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      AppLocalizations.of(context).emailSent,
                      maxLines: 1,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                    flex: 21,
                  ),
                  Spacer(
                    flex: 28,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      AppLocalizations.of(context)
                          .checkMailAccountForPasswordResetLink,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                      maxLines: 2,
                    ),
                    flex: 32,
                  ),
                  Spacer(
                    flex: 81,
                  ),
                  Flexible(
                    child: LinkButton(
                      text: AppLocalizations.of(context).login,
                      onPressed: () => Navigator.pop(context),
                    ),
                    flex: 17,
                  ),
                  Spacer(
                    flex: 158,
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 38,
            ),
          ],
        );
      },
    );
  }
}
