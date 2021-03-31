import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_images.dart';
import 'package:dart_counter/view/ios/sharedWidgets/buttons/action_button.dart';
import 'package:dart_counter/view/ios/sharedWidgets/buttons/primary_text_button.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/checkout_details_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckoutDetailsView extends StatelessWidget {

  final CheckoutDetailsViewModel model = CheckoutDetailsViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return View2(
      mobilePortrait: CheckoutDetailsViewMobilePortrait(model),
    );
  }
}

class CheckoutDetailsViewMobilePortrait extends StatelessWidget {

  final CheckoutDetailsViewModel model;

  CheckoutDetailsViewMobilePortrait(this.model);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
          final double width = boxConstraints.maxWidth;
          final double height = boxConstraints.maxHeight;
          return Row(
            children: [
              Spacer(
                flex: 25,
              ),
              Expanded(
                flex: 325,
                child: Column(
                  children: [
                    Spacer(
                      flex: 53,
                    ),
                    Expanded(
                      flex: 24,
                      child: AutoSizeText(
                        'Darts aufs Doppel - TODO',
                        maxLines: 1,
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 15,
                    ),
                    Expanded(
                      flex: 75,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: PrimaryTextButton(
                              text: '1',
                              fontSize: 45,
                              borderRadius: BorderRadius.all(Radius.circular(16.0)),
                              onPressed: () => {},
                            ),
                          ),
                          AspectRatio(
                            aspectRatio: 1,
                            child: PrimaryTextButton(
                              text: '2',
                              fontSize: 45,
                              borderRadius: BorderRadius.all(Radius.circular(16.0)),
                              onPressed: () => {},
                            ),
                          ),
                          AspectRatio(
                            aspectRatio: 1,
                            child: PrimaryTextButton(
                              text: '3',
                              fontSize: 45,
                              borderRadius: BorderRadius.all(Radius.circular(16.0)),
                              onPressed: () => {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(
                      flex: 27,
                    ),
                    // TODO divider
                    Spacer(
                      flex: 12,
                    ),
                    Expanded(
                      flex: 24,
                      child: AutoSizeText(
                        'Darts Gesamt - TODO',
                        maxLines: 1,
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 15,
                    ),
                    Expanded(
                      flex: 75,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: PrimaryTextButton(
                              text: '1',
                              fontSize: 45,
                              borderRadius: BorderRadius.all(Radius.circular(16.0)),
                              onPressed: () => {},
                            ),
                          ),
                          AspectRatio(
                            aspectRatio: 1,
                            child: PrimaryTextButton(
                              text: '2',
                              fontSize: 45,
                              borderRadius: BorderRadius.all(Radius.circular(16.0)),
                              onPressed: () => {},
                            ),
                          ),
                          AspectRatio(
                            aspectRatio: 1,
                            child: PrimaryTextButton(
                              text: '3',
                              fontSize: 45,
                              borderRadius: BorderRadius.all(Radius.circular(16.0)),
                              onPressed: () => {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(
                      flex: 27,
                    ),
                    // TODO divider
                    Spacer(
                      flex: 27,
                    ),
                    Expanded(
                      flex: 75,
                      child: ActionButton(
                        text: AppLocalizations.of(context).confirm,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Spacer(
                      flex: 154,
                    ),
                    Expanded(
                      flex: 82,
                      child: Image.asset(AppImages.adBanner),
                    ),
                  ],
                ),
              ),
              Spacer(
                flex: 25,
              ),
            ],
          );
        }
    );
  }
}
