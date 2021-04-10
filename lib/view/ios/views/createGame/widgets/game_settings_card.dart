import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/model/game/game.dart';
import 'package:dart_counter/view/ios/sharedWidgets/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GameSettingsCard extends StatefulWidget {
  final Function(int) onStartingPointsChanged;
  final Function(Mode) onModeChanged;
  final Function(int) onSizeChanged;
  final Function(Type) onTypeChanged;

  GameSettingsCard(
      {this.onStartingPointsChanged,
      this.onModeChanged,
      this.onSizeChanged,
      this.onTypeChanged})
      : assert(onStartingPointsChanged != null),
        assert(onModeChanged != null),
        assert(onSizeChanged != null),
        assert(onTypeChanged != null);

  @override
  _GameSettingsCardState createState() => _GameSettingsCardState();
}

class _GameSettingsCardState extends State<GameSettingsCard> {
  String valueStartingPoints = '0';
  String valueMode = '0';
  int valueSize = 1;
  String valueType = '0';

  @override
  Widget build(BuildContext context) {
    return Card(
      flexHeader: 44,
      middle: AutoSizeText(
        AppLocalizations.of(context).modus,
        maxLines: 1,
        style: TextStyle(
            fontSize: 23, fontWeight: FontWeight.bold, color: AppColors.white),
      ),
      flexBody: 237,
      body: Row(
        children: [
          Spacer(
            flex: 25,
          ),
          Expanded(
            flex: 328,
            child: Column(
              children: [
                Spacer(
                  flex: 13,
                ),
                AutoSizeText(
                  AppLocalizations.of(context).startingPoints,
                  maxLines: 1,
                ),
                Spacer(
                  flex: 11,
                ),
                Expanded(
                  flex: 60,
                  child: Row(
                    children: [
                      Expanded(
                        child: CupertinoSlidingSegmentedControl(
                          groupValue: valueStartingPoints,
                          children: {
                            '0': Text('301'),
                            '1': Text('501'),
                            '2': Text('701')
                          },
                          onValueChanged: (newValue) {
                            setState(() {
                              valueStartingPoints = newValue;
                            });
                            widget.onStartingPointsChanged(newValue == '0'
                                ? 301
                                : newValue == '1'
                                    ? 501
                                    : 701);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(
                  flex: 20,
                ),
                AutoSizeText(
                  AppLocalizations.of(context).gameMode,
                  maxLines: 1,
                ),
                Spacer(
                  flex: 11,
                ),
                Expanded(
                    flex: 60,
                    child: Row(
                      children: [
                        Expanded(
                          child: CupertinoSlidingSegmentedControl(
                            groupValue: valueMode,
                            children: {
                              '0': Text(
                                'FIRST TO',
                              ),
                              '1': Text(
                                'BEST OF',
                              )
                            },
                            onValueChanged: (newValue) {
                              setState(() {
                                valueMode = newValue;
                              });
                              widget.onModeChanged(
                                  newValue == '0' ? Mode.firstTo : Mode.bestOf);
                            },
                          ),
                        ),
                      ],
                    )),
                Spacer(
                  flex: 8,
                ),
                Expanded(
                  flex: 37,
                  child: CupertinoPicker(
                    children: [
                      for (var i = 1; i <= 100; i += 1) Text(i.toString())
                    ],
                    itemExtent: 25,
                    onSelectedItemChanged: (item) {
                      setState(() {
                        valueSize = item + 1;
                      });
                      widget.onSizeChanged(valueSize);
                    },
                  ),
                ),
                Spacer(
                  flex: 8,
                ),
                Expanded(
                  flex: 60,
                  child: Row(
                    children: [
                      Expanded(
                        child: CupertinoSlidingSegmentedControl(
                          groupValue: valueType,
                          children: {
                            '0': Text(valueSize == 1 ? 'LEG' : 'LEGS'),
                            '1': Text(valueSize == 1 ? 'SET' : 'SETS')
                          },
                          onValueChanged: (newValue) {
                            setState(() {
                              valueType = newValue;
                            });
                            widget.onTypeChanged(
                                newValue == '0' ? Type.legs : Type.sets);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(
                  flex: 17,
                ),
              ],
            ),
          ),
          Spacer(
            flex: 25,
          ),
        ],
      ),
    );
  }
}
