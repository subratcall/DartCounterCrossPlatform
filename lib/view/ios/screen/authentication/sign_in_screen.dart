import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/routes.dart';
import 'package:dart_counter/view/ios/widget/link_button.dart';
import 'package:dart_counter/view/ios/widget/primary_button.dart';
import 'package:dart_counter/view/ios/widget/social_media_button.dart';
import 'package:dart_counter/view/ios/widget/textfield.dart';
import 'package:dart_counter/view/screen.dart';
import 'package:dart_counter/viewmodel/authentication/sign_in_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInScreen extends StatefulWidget {

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Screen<SignInViewModel>(builder: (context, model, child) {
      return CupertinoPageScaffold(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                Flexible(
                  child: Column(
                    children: [
                      Spacer(flex: 120,),
                      Row(
                        children: [
                          Spacer(flex: 120,),
                          Flexible(child: Image.asset(AppImages.logo), flex: 135,),
                          Spacer(flex: 120,),
                        ],
                      ),
                      Spacer(flex: 120,),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      Spacer(
                        flex: 8,
                      ),
                      Flexible(
                        child: TextField(
                          placeholder: AppLocalizations.of(context).email,
                          controller: emailController,
                        ),
                        flex: 36,
                      ),
                      Spacer(
                        flex: 16,
                      ),
                      Flexible(
                        child: TextField(
                          placeholder: AppLocalizations.of(context).password,
                          controller: passwordController,
                        ),
                        flex: 36,
                      ),
                      Spacer(
                        flex: 16,
                      ),
                      Flexible(
                          child: PrimaryButton(
                            text: AppLocalizations.of(context).login,
                            onPressed: () =>
                                model.onSignPressed(email: emailController.text, password: passwordController.text),
                          ),
                          flex: 48),
                      Spacer(
                        flex: 16,
                      ),
                      Flexible(
                          child: LinkButton(
                            text: AppLocalizations.of(context).forgotPassword,
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.resetPassword);
                            },
                          ),
                          flex: 16),
                      Spacer(
                        flex: 56,
                      ),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SocialMediaButton(
                              type: SocialMediaButtonType.facebook,
                              onPressed: () => model.onSignInFacebookPressed(),
                            ),
                            SocialMediaButton(
                              type: SocialMediaButtonType.google,
                              onPressed: () => model.onSignInGooglePressed(),
                            ),
                            SocialMediaButton(
                              type: SocialMediaButtonType.instagram,
                              onPressed: () => model.onSignInInstagramPressed(),
                            ),
                          ],
                        ),
                        flex: 48,
                      ),
                      Spacer(
                        flex: 28,
                      ),
                      Flexible(
                          child: LinkButton(
                            text: AppLocalizations.of(context).registerNow,
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.signUp);
                            },
                          ),
                          flex: 16),
                      Spacer(
                        flex: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
