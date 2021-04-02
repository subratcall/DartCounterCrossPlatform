import 'package:dart_counter/app_errors.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/view/ios/sharedWidgets/buttons/link_button.dart';
import 'package:dart_counter/view/ios/sharedWidgets/buttons/primary_text_button.dart';
import 'package:dart_counter/view/ios/sharedWidgets/textfield.dart';
import 'package:dart_counter/view/ios/views/loading_view.dart';
import 'package:dart_counter/view/toast.dart';
import 'package:dart_counter/viewmodel/sign_up_viewmodel.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpViewMobilePortrait extends StatelessWidget {
  final SignUpViewModel model;
  final PageController pageController;

  SignUpViewMobilePortrait(this.model, this.pageController);

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
          final double width = boxConstraints.maxWidth;
          final double height = boxConstraints.maxHeight;
          return StreamBuilder<ViewState>(
            initialData: ViewState.idle,
            stream: model.outputViewState,
            builder: (context, snapshot) => snapshot.data == ViewState.idle
                ? SingleChildScrollView(
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
                            flex: 99,
                          ),
                          Expanded(
                            flex: 166,
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
                          ),
                          Spacer(
                            flex: 58,
                          ),
                          Expanded(
                            child: TextField(
                              outputText: model.inputEmail,
                              inputIsValid: model.outputErrorEmail
                                  .map((error) => error == null),
                              placeholder: AppLocalizations.of(context).email,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => node.nextFocus(),
                            ),
                            flex: 36,
                          ),
                          Spacer(
                            flex: 15,
                          ),
                          Expanded(
                            child: TextField(
                              outputText: model.inputUsername,
                              inputIsValid: model.outputErrorUsername
                                  .map((error) => error == null),
                              placeholder:
                              AppLocalizations.of(context).username,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => node.nextFocus(),
                            ),
                            flex: 36,
                          ),
                          Spacer(
                            flex: 15,
                          ),
                          Expanded(
                            child: TextField(
                              outputText: model.inputPassword,
                              inputIsValid: model.outputErrorPassword
                                  .map((error) => error == null),
                              placeholder:
                              AppLocalizations.of(context).password,
                              obscureText: true,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => node.nextFocus(),
                            ),
                            flex: 36,
                          ),
                          Spacer(
                            flex: 15,
                          ),
                          Expanded(
                            child: TextField(
                              outputText: model.inputPasswordAgain,
                              inputIsValid: model.outputErrorPasswordAgain
                                  .map((error) => error == null),
                              placeholder:
                              AppLocalizations.of(context).passwordAgain,
                              obscureText: true,
                              textInputAction: TextInputAction.done,
                              onEditingComplete: () => node.unfocus(),
                            ),
                            flex: 36,
                          ),
                          Spacer(
                            flex: 25,
                          ),
                          Expanded(
                            child: PrimaryTextButton(
                              text: AppLocalizations.of(context).register,
                              onPressed: () {
                                model.onRegisterPressed().catchError((error) {
                                  if (error is InvalidEmailAddressError) {
                                    Toast.showToast(AppLocalizations.of(context).errorInvalidEmailAddress);
                                  } else if (error is InvalidUsernameError) {
                                    Toast.showToast(AppLocalizations.of(context).errorInvalidUsername);
                                  } else if (error is InvalidPasswordError) {
                                    Toast.showToast(AppLocalizations.of(context).errorInvalidPassword);
                                  } else if (error
                                  is PasswordNotEqualPasswordAgainError) {
                                    Toast.showToast(AppLocalizations.of(context).errorPasswordNotEqualPasswordAgain);
                                  } else if (error
                                  is EmailAddressAlreadyInUseError) {
                                    Toast.showToast(AppLocalizations.of(context).errorEmailAddressAlreadyInUse);
                                  } else {
                                    Toast.showToast(AppLocalizations.of(context).errorNetwork);
                                  }
                                });
                              },
                            ),
                            flex: 50,
                          ),
                          Spacer(
                            flex: 19,
                          ),
                          Flexible(
                            child: LinkButton(
                              text: AppLocalizations.of(context).login,
                              onPressed: () => pageController.animateToPage(0,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn),
                            ),
                            flex: 17,
                          ),
                          Spacer(
                            flex: 107,
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
            )
                : LoadingView(),
          );
        });
  }
}