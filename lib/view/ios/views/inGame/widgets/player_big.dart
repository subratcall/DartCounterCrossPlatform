import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/model/player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlayerBig extends StatelessWidget {
  final Player player;

  PlayerBig(this.player);

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
            Spacer(flex: 30),
            Expanded(
              flex: 298,
              child: Column(
                children: [
                  Spacer(
                    flex: 17,
                  ),
                  Expanded(
                    flex: 25,
                    child: Row(
                      children: [
                        Spacer(
                          flex: 70,
                        ),
                        Expanded(
                          flex: 218,
                          child: Center(
                            child: AutoSizeText(
                              player.id == -1 ? 'Dartbot' : player.name ?? '${AppLocalizations.of(context).player} ${player.id}',
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
                          flex: 70,
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 19,
                  ),
                  Expanded(
                    flex: 23,
                    child: player.wonSets == null ? Row(
                      children: [
                        Spacer(flex: 118),
                        Expanded(
                          flex: 61,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            child: Container(
                              color: AppColors.yellow,
                              child: Center(
                                child: AutoSizeText(
                                  'L: ' + player.wonLegsCurrentSet.toString(),
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex: 118),
                      ],
                    ) : Row(
                      children: [
                        Spacer(flex: 52),
                        Expanded(
                            flex: 60,
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
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                        Spacer(flex: 73),
                        Expanded(
                          flex: 60,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            child: Container(
                              color: AppColors.yellow,
                              child: Center(
                                child: AutoSizeText(
                                  'L: ' + player.wonLegsCurrentSet.toString(),
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex: 52),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 26,
                  ),
                  Expanded(
                    flex: 65,
                    child: Row(
                      children: [
                        Spacer(
                          flex: 70,
                        ),
                        Expanded(
                          flex: 158,
                          child: Center(
                            child: AutoSizeText(
                              player.pointsLeft.toString(),
                              maxLines: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 100,
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
                    flex: 13,
                  ),
                  Expanded(
                    flex: 15,
                    child: Row(
                      children: [
                        Spacer(
                          flex: 135,
                        ),
                        Expanded(
                          flex: 28,
                          child: Center(
                            child: AutoSizeText(
                              player.lastPoints?.toString() ?? '-',
                              maxLines: 1,
                              minFontSize: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Spacer(
                          flex: 135,
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 33,
                  ),
                  Expanded(
                    flex: 20,
                    child: Row(
                      children: [
                        Spacer(
                          flex: 55,
                        ),
                        Expanded(
                          flex: 190,
                          child: Center(
                            child: AutoSizeText(
                              AppLocalizations.of(context).dartsThrown +
                                  ' : ' +
                                  player.dartsThrownCurrentLeg.toString(),
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
                          flex: 55,
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 17,
                  ),
                  Expanded(
                    flex: 20,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 135,
                          child: Center(
                            child: AutoSizeText(
                              AppLocalizations.of(context).average +
                                  ' : ' +
                                  player.stats.average.toStringAsFixed(2),
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
                          flex: 28,
                        ),
                        Expanded(
                          flex: 135,
                          child: Center(
                            child: AutoSizeText(
                              AppLocalizations.of(context).checkoutPercentage +
                                  ' : ' +
                                  player.stats.checkoutPercentage
                                      .toStringAsFixed(2),
                              maxLines: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 33,
                  ),
                ],
              ),
            ),
            Spacer(flex: 30),
          ],
        ),
      ),
    );
  }
}
