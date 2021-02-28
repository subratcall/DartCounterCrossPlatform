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

class SignInScreen extends StatelessWidget {
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
                  child: Center(
                    child: Image.asset(AppImages.logo),
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      Spacer(
                        flex: 8,
                      ),
                      Flexible(
                        child: TextField(),
                        flex: 36,
                      ),
                      Spacer(
                        flex: 16,
                      ),
                      Flexible(child: TextField(), flex: 36),
                      Spacer(
                        flex: 4,
                      ),
                      Flexible(
                          child: Center(
                            child: Text('Error'),
                          ),
                          flex: 8),
                      Spacer(
                        flex: 8,
                      ),
                      Flexible(child: PrimaryButton(), flex: 48),
                      Spacer(
                        flex: 16,
                      ),
                      Flexible(
                          child: Center(
                            child: Text('Forgot password'),
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
}
