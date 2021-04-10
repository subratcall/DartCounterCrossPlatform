import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/model/player/player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlayerMedium extends StatelessWidget {
  final Player player;

  PlayerMedium(this.player);

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
            Spacer(flex: 10),
            Expanded(
              flex: 158,
              child: Column(
                children: [
                  Spacer(
                    flex: 12,
                  ),
                  Expanded(
                    flex: 25,
                    child: Row(
                      children: [
                        Spacer(
                          flex: 29,
                        ),
                        Expanded(
                          flex: 100,
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
                    flex: 16,
                  ),
                  Expanded(
                    flex: 23,
                    child: player.wonSets == null
                        ? Row(
                            children: [
                              Spacer(flex: 55),
                              Expanded(
                                flex: 48,
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
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(flex: 55),
                            ],
                          )
                        : Row(
                            children: [
                              Spacer(flex: 18),
                              Expanded(
                                  flex: 47,
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
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              Spacer(flex: 28),
                              Expanded(
                                flex: 47,
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
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(flex: 18),
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
                          flex: 18,
                        ),
                        Expanded(
                          flex: 122,
                          child: Center(
                            child: AutoSizeText(
                              player.pointsLeft.toString(),
                              maxLines: 1,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 80,
                              ),
                            ),
                          ),
                        ),
                        Spacer(
                          flex: 18,
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 18,
                  ),
                  Expanded(
                    flex: 15,
                    child: Row(
                      children: [
                        Spacer(
                          flex: 68,
                        ),
                        Expanded(
                          flex: 22,
                          child: Center(
                            child: AutoSizeText(
                              player.lastPoints?.toString() ?? '-',
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
                        Spacer(
                          flex: 68,
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 35,
                  ),
                  Expanded(
                    flex: 20,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 190,
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
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 11,
                  ),
                  Expanded(
                    flex: 20,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 190,
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
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 11,
                  ),
                  Expanded(
                    flex: 20,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 190,
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
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 46,
                  ),
                ],
              ),
            ),
            Spacer(flex: 10),
          ],
        ),
      ),
    );
  }
}
