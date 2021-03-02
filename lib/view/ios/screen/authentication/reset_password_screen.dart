import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/app_errors.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/view/ios/screen/loading_screen.dart';
import 'package:dart_counter/view/ios/widget/button/link_button.dart';
import 'package:dart_counter/view/ios/widget/button/primary_text_button.dart';
import 'package:dart_counter/view/ios/widget/textfield.dart';
import 'package:dart_counter/view/screen.dart';
import 'package:dart_counter/view/toast.dart';
import 'package:dart_counter/viewmodel/authentication/reset_password_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Screen<ResetPasswordViewModel>(builder: (context, model, child) {
      return model.viewState == ResetPasswordViewState.idle
          ? ResetPasswordInitial(model)
          : model.viewState == ResetPasswordViewState.successful
              ? ResetPasswordSuccess()
              : LoadingScreen();
    });
  }
}

class ResetPasswordInitial extends StatefulWidget {
  final ResetPasswordViewModel model;

  ResetPasswordInitial(this.model);

  @override
  _ResetPasswordInitialState createState() => _ResetPasswordInitialState();
}

class _ResetPasswordInitialState extends State<ResetPasswordInitial> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
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
      child: GestureDetector(
        child: SafeArea(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: ConstrainedBox(
              // TODO fix scrollable should not be calc right size here
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
                maxHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
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
                        AppLocalizations.of(context).insertEmailToResetPassword,
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
                        placeholder: AppLocalizations.of(context).email,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                      ),
                      flex: 36,
                    ),
                    Spacer(
                      flex: 47,
                    ),
                    Expanded(
                      child: PrimaryTextButton(
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

                          widget.model
                              .onConfirmPressed(email: emailController.text)
                              .catchError((error) {
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
            ),
          ),
        ),
        onTap: () => FocusScope.of(context).unfocus(),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}

class ResetPasswordSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
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
      ),
    );
  }
}
