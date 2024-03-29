import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/view/ios/extensions/extensions.dart';
import 'package:dart_counter/view/ios/sharedWidgets/buttons/primary_text_button.dart';
import 'package:dart_counter/view/ios/sharedWidgets/textfield.dart';
import 'package:dart_counter/view/ios/views/signUp/widgets/error_label.dart';
import 'package:dart_counter/view/toast.dart';
import 'package:dart_counter/viewmodel/reset_password_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                          inputIsValid: model.outputErrorEmail
                              .map((error) => error == null),
                          placeholder: AppLocalizations.of(context).email,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          onEditingComplete: () => node.unfocus(),
                        ),
                        flex: 36,
                      ),
                      StreamBuilder<Error>(
                        initialData: null,
                        stream: model.outputErrorEmail,
                        builder: (context, snapshot) => snapshot.data == null
                            ? Spacer(
                                flex: 15,
                              )
                            : Expanded(
                                flex: 15,
                                child: ErrorLabel(
                                    getErrorMessage(context, snapshot.data)),
                              ),
                      ),
                      Spacer(
                        flex: 32,
                      ),
                      Expanded(
                        child: PrimaryTextButton(
                          text: AppLocalizations.of(context).confirm,
                          onPressed: () {
                            model.onConfirmPressed().catchError((error) {
                              Toast.showToast(getErrorMessage(context, error));
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
