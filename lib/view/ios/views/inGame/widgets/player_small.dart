import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/model/player/player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlayerSmall extends StatelessWidget {
  final Player player;

  PlayerSmall(this.player);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(16.0),
      ),
      child: Container(
        color: player.isCurrentTurn ? AppColors.black2 : AppColors.black,
        child: Row(
          children: [
            Spacer(flex: 8),
            Expanded(
              flex: 158,
              child: Column(
                children: [
                  Spacer(
                    flex: 10,
                  ),
                  Expanded(
                    flex: 15,
                    child: Row(
                      children: [
                        Spacer(
                          flex: 29,
                        ),
                        Expanded(
                          flex: 96,
                          child: Center(
                            child: AutoSizeText(
                              player.name ??
                                      '${AppLocalizations.of(context).player} ${player.id}',
                              maxLines: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                              ),
                            ),
                          ),
                        ),
                        Spacer(
                          flex: 29,
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 13,
                  ),
                  Expanded(
                    flex: 13,
                    child: player.wonSets == null
                        ? Row(
                            children: [
                              Spacer(flex: 59),
                              Expanded(
                                flex: 36,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  child: Container(
                                    color: AppColors.yellow,
                                    child: Center(
                                      child: AutoSizeText(
                                        'L: ' +
                                            player.wonLegsCurrentSet.toString(),
                                        maxLines: 1,
                                        minFontSize: 1,
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(flex: 59),
                            ],
                          )
                        : Row(
                            children: [
                              Spacer(flex: 29),
                              Expanded(
                                  flex: 36,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                    child: Container(
                                      color: AppColors.yellow,
                                      child: Center(
                                        child: AutoSizeText(
                                          'S: ' + player.wonSets.toString(),
                                          maxLines: 1,
                                          minFontSize: 1,
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              Spacer(flex: 24),
                              Expanded(
                                flex: 36,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  child: Container(
                                    color: AppColors.yellow,
                                    child: Center(
                                      child: AutoSizeText(
                                        'L: ' +
                                            player.wonLegsCurrentSet.toString(),
                                        maxLines: 1,
                                        minFontSize: 1,
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(flex: 29),
                            ],
                          ),
                  ),
                  Spacer(
                    flex: 14,
                  ),
                  Expanded(
                    flex: 24,
                    child: Row(
                      children: [
                        Spacer(
                          flex: 46,
                        ),
                        Expanded(
                          flex: 62,
                          child: Center(
                            child: AutoSizeText(
                              player.pointsLeft.toString(),
                              maxLines: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 37,
                              ),
                            ),
                          ),
                        ),
                        Spacer(
                          flex: 46,
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 10,
                  ),
                  Expanded(
                    flex: 8,
                    child: Row(
                      children: [
                        Spacer(
                          flex: 70,
                        ),
                        Expanded(
                          flex: 14,
                          child: Center(
                            child: AutoSizeText(
                              player.lastPoints?.toString() ?? '-',
                              maxLines: 1,
                              minFontSize: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 9,
                              ),
                            ),
                          ),
                        ),
                        Spacer(
                          flex: 70,
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 14,
                  ),
                  Expanded(
                    flex: 10,
                    child: Row(
                      children: [
                        Spacer(
                          flex: 25,
                        ),
                        Expanded(
                          flex: 104,
                          child: Center(
                            child: AutoSizeText(
                              AppLocalizations.of(context).dartsThrown +
                                  ' : ' +
                                  player.dartsThrownCurrentLeg.toString(),
                              maxLines: 1,
                              minFontSize: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Spacer(
                          flex: 25,
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 11,
                  ),
                  Expanded(
                    flex: 10,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 67,
                          child: Center(
                            child: AutoSizeText(
                              AppLocalizations.of(context).average +
                                  ' : ' +
                                  player.stats.average.toStringAsFixed(2),
                              maxLines: 1,
                              minFontSize: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Spacer(
                          flex: 20,
                        ),
                        Expanded(
                          flex: 67,
                          child: Center(
                            child: AutoSizeText(
                              AppLocalizations.of(context).checkoutPercentage +
                                  ' : ' +
                                  player.stats.checkoutPercentage
                                      .toStringAsFixed(2),
                              maxLines: 1,
                              minFontSize: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 6,
                  ),
                ],
              ),
            ),
            Spacer(flex: 8),
          ],
        ),
      ),
    );
  }
}
