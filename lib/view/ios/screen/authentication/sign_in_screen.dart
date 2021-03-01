import 'package:dart_counter/app_errors.dart';
import 'package:dart_counter/app_routes.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/main.dart';
import 'package:dart_counter/view/ios/screen/authentication/reset_password_screen.dart';
import 'package:dart_counter/view/ios/screen/loading_screen.dart';
import 'package:dart_counter/view/ios/widget/link_button.dart';
import 'package:dart_counter/view/ios/widget/primary_button.dart';
import 'package:dart_counter/view/ios/widget/social_media_button.dart';
import 'package:dart_counter/view/ios/widget/textfield.dart';
import 'package:dart_counter/view/screen.dart';
import 'package:dart_counter/view/toast.dart';
import 'package:dart_counter/viewmodel/authentication/sign_in_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Scaffold;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SignInScreen extends StatefulWidget {

  final PageController pageController;

  SignInScreen(this.pageController);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Screen<SignInViewModel>(builder: (context, model, child) {
      return model.viewState == SignInViewState.idle ? Scaffold(
        body: CupertinoScaffold(
          body: Builder(
            builder: (context) => CupertinoPageScaffold(
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
                              flex: 107,
                            ),
                            Expanded(
                              child: TextField(
                                placeholder: AppLocalizations.of(context).email,
                                controller: emailController,
                                textInputAction: TextInputAction.next,
                                onEditingComplete: () => node.nextFocus(),
                              ),
                              flex: 36,
                            ),
                            Spacer(
                              flex: 16,
                            ),
                            Expanded(
                              child: TextField(
                                placeholder:
                                AppLocalizations.of(context).password,
                                controller: passwordController,
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
                              child: PrimaryButton(
                                  text: AppLocalizations.of(context).login,
                                  onPressed: () {
                                    // TODO this is only a workaround find a better solution for this e.g with global key
                                    var errorMessages = {
                                       'errorInvalidEmailAddressOrPassword' : AppLocalizations.of(context).errorInvalidEmailAddressOrPassword,
                                       'errorNetwork' : AppLocalizations.of(context).errorNetwork,
                                    };

                                    model.onSignPressed(email: emailController.text, password: passwordController.text)
                                        .catchError((error) {
                                          if(error is InvalidEmailAddressOrPasswordError) {
                                            Toast.showToast(errorMessages['errorInvalidEmailAddressOrPassword']);
                                          } else {
                                            Toast.showToast(errorMessages['errorNetwork']);
                                          }
                                    });
                                  }),
                              flex: 50,
                            ),
                            Spacer(
                              flex: 15,
                            ),
                            Flexible(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(6.0, 0, 0, 0),
                                  child: LinkButton(
                                      text: AppLocalizations.of(context)
                                          .forgotPassword,
                                      onPressed: () => CupertinoScaffold
                                          .showCupertinoModalBottomSheet(
                                          expand: true,
                                          context: context,
                                          backgroundColor:
                                          AppColors.transparent,
                                          builder: (context) =>
                                              ResetPasswordScreen())),
                                ),
                              ),
                              flex: 17,
                            ),
                            Spacer(
                              flex: 53,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  SocialMediaButton(
                                    type: SocialMediaButtonType.facebook,
                                    onPressed: () =>
                                        model.onSignInFacebookPressed(),
                                  ),
                                  SocialMediaButton(
                                    type: SocialMediaButtonType.google,
                                    onPressed: () =>
                                        model.onSignInGooglePressed(),
                                  ),
                                  SocialMediaButton(
                                    type: SocialMediaButtonType.instagram,
                                    onPressed: () =>
                                        model.onSignInInstagramPressed(),
                                  ),
                                ],
                              ),
                              flex: 48,
                            ),
                            Spacer(
                              flex: 30,
                            ),
                            Flexible(
                              child: LinkButton(
                                text: AppLocalizations.of(context).registerNow,
                                onPressed: () => widget.pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.easeIn),
                              ),
                              flex: 17,
                            ),
                            Spacer(
                              flex: 16,
                            ),
                          ],
                        )),
                  ),
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
    passwordController.dispose();
    super.dispose();
  }
}
