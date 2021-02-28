import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/routes.dart';
import 'package:dart_counter/view/ios/widget/link_button.dart';
import 'package:dart_counter/view/ios/widget/primary_button.dart';
import 'package:dart_counter/view/ios/widget/textfield.dart';
import 'package:dart_counter/view/screen.dart';
import 'package:dart_counter/viewmodel/authentication/sign_up_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordAgainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Screen<SignUpViewModel>(builder: (context, model, child) {
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
                          placeholder: AppLocalizations.of(context).username,
                          controller: usernameController,
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
                        child: TextField(
                          placeholder: AppLocalizations.of(context).passwordAgain,
                          controller: passwordAgainController,
                        ),
                        flex: 36,
                      ),
                      Spacer(
                        flex: 16,
                      ),
                      Flexible(
                          child: PrimaryButton(
                            text: AppLocalizations.of(context).register,
                            onPressed: () =>
                                model.onConfirmPressed(
                                    email: emailController.text,
                                    username: usernameController.text,
                                    password:  passwordController.text,
                                    passwordAgain: passwordAgainController.text
                                ),
                          ),
                          flex: 48),
                      Spacer(
                        flex: 16,
                      ),
                      Flexible(
                          child: LinkButton(
                            text: AppLocalizations.of(context).login,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          flex: 16),
                      Spacer(
                        flex: 100,
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
}
