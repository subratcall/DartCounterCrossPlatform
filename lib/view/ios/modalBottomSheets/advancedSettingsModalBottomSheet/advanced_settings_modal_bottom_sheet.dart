import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdvancedSettingsModalBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Material(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
              tileColor: AppColors.black2,
              title: Text(
                AppLocalizations.of(context).showAverage,
                style: TextStyle(color: AppColors.white),
              ),
              trailing: CupertinoSwitch(
                value: true,
              ),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
              tileColor: AppColors.black2,
              title: Text(
                AppLocalizations.of(context).showCheckoutPercentage,
                style: TextStyle(color: AppColors.white),
              ),
              trailing: CupertinoSwitch(
                value: false,
              ),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
              tileColor: AppColors.black2,
              title: Row(
                children: [
                  Spacer(
                    flex: 104,
                  ),
                  Expanded(
                    flex: 167,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      child: Container(
                        color: AppColors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.delete,
                                color: AppColors.white,
                              ),
                              Spacer(
                                flex: 10,
                              ),
                              Expanded(
                                flex: 70,
                                child: AutoSizeText(
                                  AppLocalizations.of(context).removePlayer,
                                  minFontSize: 1,
                                  maxLines: 1,
                                  style: TextStyle(color: AppColors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 104,
                  ),
                ],
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
              tileColor: AppColors.black2,
              title: Row(
                children: [
                  Spacer(
                    flex: 134,
                  ),
                  Expanded(
                      flex: 107,
                      child: CupertinoButton(
                        onPressed: () => Navigator.pop(context),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          child: Container(
                            color: AppColors.green,
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Center(
                                child: AutoSizeText(
                                  AppLocalizations.of(context).done,
                                  minFontSize: 1,
                                  maxLines: 1,
                                  style: TextStyle(color: AppColors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                  Spacer(
                    flex: 134,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
