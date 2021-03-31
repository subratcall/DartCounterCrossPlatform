import 'package:dart_counter/app_errors.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/view/ios/sharedWidgets/buttons/link_button.dart';
import 'package:dart_counter/view/ios/sharedWidgets/buttons/primary_text_button.dart';
import 'package:dart_counter/view/ios/sharedWidgets/textfield.dart';
import 'package:dart_counter/view/ios/views/loading_view.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/toast.dart';
import 'package:dart_counter/viewmodel/sign_up_viewmodel.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class SignUpView extends StatelessWidget {

  final SignUpViewModel model = SignUpViewModelImpl();
  final PageController pageController;

  SignUpView(this.pageController);

  @override
  Widget build(BuildContext context) {
    return View2(
      mobilePortrait: SignUpViewMobilePortrait(model, pageController),
    );
  }
}

class SignUpViewMobilePortrait extends StatefulWidget {

  final SignUpViewModel model;
  final PageController pageController;

  SignUpViewMobilePortrait(this.model, this.pageController);

  @override
  _SignUpViewMobilePortraitState createState() => _SignUpViewMobilePortraitState();
}

class _SignUpViewMobilePortraitState extends State<SignUpViewMobilePortrait> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordAgainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
          final double width = boxConstraints.maxWidth;
          final double height = boxConstraints.maxHeight;
          return StreamBuilder<ViewState>(
            stream: widget.model.outputViewState,
            builder: (context, snapshot) => snapshot.data == ViewState.idle
                ? SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Builder(
                  builder: (context) => ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width,
                      maxHeight: MediaQuery.of(context).size.height,
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
                                  placeholder:
                                  AppLocalizations.of(context).email,
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () => node.nextFocus(),
                                  isValid: widget.model.emailIsValid,
                                ),
                                flex: 36,
                              ),
                              Spacer(
                                flex: 15,
                              ),
                              Expanded(
                                child: TextField(
                                  placeholder:
                                  AppLocalizations.of(context).username,
                                  controller: usernameController,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () => node.nextFocus(),
                                  isValid: widget.model.usernameIsValid,
                                ),
                                flex: 36,
                              ),
                              Spacer(
                                flex: 15,
                              ),
                              Expanded(
                                child: TextField(
                                  placeholder:
                                  AppLocalizations.of(context).password,
                                  controller: passwordController,
                                  obscureText: true,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () => node.nextFocus(),
                                  isValid: widget.model.passwordIsValid,
                                ),
                                flex: 36,
                              ),
                              Spacer(
                                flex: 15,
                              ),
                              Expanded(
                                child: TextField(
                                  placeholder: AppLocalizations.of(context)
                                      .passwordAgain,
                                  controller: passwordAgainController,
                                  obscureText: true,
                                  textInputAction: TextInputAction.done,
                                  onEditingComplete: () => node.unfocus(),
                                  isValid: widget.model.passwordAgainIsValid,
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
                                    // TODO this is only a workaround find a better solution for this e.g with global key
                                    var errorMessages = {
                                      'errorInvalidEmailAddress':
                                      AppLocalizations.of(context)
                                          .errorInvalidEmailAddress,
                                      'errorInvalidUsername':
                                      AppLocalizations.of(context)
                                          .errorInvalidUsername,
                                      'errorInvalidPassword':
                                      AppLocalizations.of(context)
                                          .errorInvalidPassword,
                                      'errorPasswordNotEqualPasswordAgain':
                                      AppLocalizations.of(context)
                                          .errorPasswordNotEqualPasswordAgain,
                                      'errorEmailAddressAlreadyInUse':
                                      AppLocalizations.of(context)
                                          .errorEmailAddressAlreadyInUse,
                                      'errorNetwork':
                                      AppLocalizations.of(context)
                                          .errorNetwork,
                                    };

                                    widget.model
                                        .onRegisterPressed(
                                        email: emailController.text,
                                        username: usernameController.text,
                                        password: passwordController.text,
                                        passwordAgain:
                                        passwordAgainController.text)
                                        .catchError((error) {
                                      if (error is InvalidEmailAddressError) {
                                        Toast.showToast(errorMessages[
                                        'errorInvalidEmailAddress']);
                                      } else if (error
                                      is InvalidUsernameError) {
                                        Toast.showToast(errorMessages[
                                        'errorInvalidUsername']);
                                      } else if (error
                                      is InvalidPasswordError) {
                                        Toast.showToast(errorMessages[
                                        'errorInvalidPassword']);
                                      } else if (error
                                      is PasswordNotEqualPasswordAgainError) {
                                        Toast.showToast(errorMessages[
                                        'errorPasswordNotEqualPasswordAgain']);
                                      } else if (error
                                      is EmailAddressAlreadyInUseError) {
                                        Toast.showToast(errorMessages[
                                        'errorEmailAddressAlreadyInUse']);
                                      } else {
                                        Toast.showToast(
                                            errorMessages['errorNetwork']);
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
                                  onPressed: () => widget.pageController
                                      .animateToPage(0,
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
                        )
                      ],
                    ),
                  ),
                ))
                : LoadingView(),
          );
        }
    );
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
