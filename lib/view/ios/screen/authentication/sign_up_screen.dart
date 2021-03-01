import 'package:dart_counter/app_errors.dart';
import 'package:dart_counter/app_routes.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/view/ios/screen/loading_screen.dart';
import 'package:dart_counter/view/ios/widget/link_button.dart';
import 'package:dart_counter/view/ios/widget/primary_button.dart';
import 'package:dart_counter/view/ios/widget/textfield.dart';
import 'package:dart_counter/view/screen.dart';
import 'package:dart_counter/view/toast.dart';
import 'package:dart_counter/viewmodel/authentication/sign_up_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordAgainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Screen<SignUpViewModel>(builder: (context, model, child) {
      return model.viewState == SignUpViewState.idle ? CupertinoPageScaffold(
        child: SafeArea(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: ConstrainedBox(
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
                      flex: 58,
                    ),
                    Expanded(
                      child: TextField(
                        placeholder: AppLocalizations.of(context).email,
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => node.nextFocus(),
                        isValid: model.emailIsValid,
                      ),
                      flex: 36,
                    ),
                    Spacer(
                      flex: 15,
                    ),
                    Expanded(
                      child: TextField(
                        placeholder: AppLocalizations.of(context).username,
                        controller: usernameController,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => node.nextFocus(),
                        isValid: model.usernameIsValid,
                      ),
                      flex: 36,
                    ),
                    Spacer(
                      flex: 15,
                    ),
                    Expanded(
                      child: TextField(
                        placeholder: AppLocalizations.of(context).password,
                        controller: passwordController,
                        obscureText: true,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => node.nextFocus(),
                        isValid: model.passwordIsValid,
                      ),
                      flex: 36,
                    ),
                    Spacer(
                      flex: 15,
                    ),
                    Expanded(
                      child: TextField(
                        placeholder: AppLocalizations.of(context).passwordAgain,
                        controller: passwordAgainController,
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () => node.unfocus(),
                        isValid: model.passwordAgainIsValid,
                      ),
                      flex: 36,
                    ),
                    Spacer(
                      flex: 25,
                    ),
                    Expanded(
                      child: PrimaryButton(
                        text: AppLocalizations.of(context).register,
                        onPressed: () {
                          // TODO this is only a workaround find a better solution for this e.g with global key
                          var errorMessages = {
                            'errorInvalidEmailAddress' : AppLocalizations.of(context).errorInvalidEmailAddress,
                            'errorInvalidUsername' : AppLocalizations.of(context).errorInvalidUsername,
                            'errorInvalidPassword' : AppLocalizations.of(context).errorInvalidPassword,
                            'errorPasswordNotEqualPasswordAgain' : AppLocalizations.of(context).errorPasswordNotEqualPasswordAgain,
                            'errorEmailAddressAlreadyInUse' : AppLocalizations.of(context).errorEmailAddressAlreadyInUse,
                            'errorNetwork' : AppLocalizations.of(context).errorNetwork,
                          };

                          model.onRegisterPressed(email: emailController.text, password: passwordController.text, passwordAgain: passwordAgainController.text)
                              .then((_) {
                                Navigator.pop(context);
                              })
                              .catchError((error) {
                            if(error is InvalidEmailAddressError) {
                              Toast.showToast(errorMessages['errorInvalidEmailAddress']);
                            } else if(error is InvalidUsernameError) {
                              Toast.showToast(errorMessages['errorInvalidUsername']);
                            }else if(error is InvalidPasswordError) {
                              Toast.showToast(errorMessages['errorInvalidPassword']);
                            }else if(error is PasswordNotEqualPasswordAgainError) {
                              Toast.showToast(errorMessages['errorPasswordNotEqualPasswordAgain']);
                            }else if(error is EmailAddressAlreadyInUseError) {
                              Toast.showToast(errorMessages['errorEmailAddressAlreadyInUse']);
                            } else {
                              Toast.showToast(errorMessages['errorNetwork']);
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
                        onPressed: () =>
                            Navigator.pop(context),
                      ),
                      flex: 17,
                    ),
                    Spacer(
                      flex: 109,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ) : LoadingScreen();
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    passwordAgainController.dispose();
    super.dispose();
  }
}
