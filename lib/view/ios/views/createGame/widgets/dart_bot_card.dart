import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/view/ios/sharedWidgets/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DartBotCard extends StatefulWidget {
  final Function(bool) onActiveChanged;
  final Function(int) onAverageChanged;

  DartBotCard({this.onActiveChanged, this.onAverageChanged})
      : assert(onActiveChanged != null),
        assert(onAverageChanged != null);

  @override
  _DartBotCardState createState() => _DartBotCardState();
}

class _DartBotCardState extends State<DartBotCard> {
  bool show = false;
  double sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      flexHeader: 44,
      middle: AutoSizeText(
        AppLocalizations.of(context).dartbot,
        maxLines: 1,
        style: TextStyle(
            fontSize: 23, fontWeight: FontWeight.bold, color: AppColors.white),
      ),
      trailing: CupertinoSwitch(
        value: show,
        onChanged: (value) {
          widget.onActiveChanged(value);
          setState(() {
            show = !show;
          });
        },
      ),
      flexBody: show ? 71 : 0,
      body: show
          ? Column(
              children: [
                Spacer(
                  flex: 13,
                ),
                Expanded(
                  flex: 20,
                  child: Row(
                    children: [
                      AutoSizeText(
                        AppLocalizations.of(context).dartbotAverage,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 11,
                ),
                Expanded(
                  flex: 30,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 264,
                        child: CupertinoSlider(
                            min: 1,
                            max: 130,
                            activeColor: sliderValue <= 50
                                ? AppColors.green
                                : sliderValue <= 80
                                    ? AppColors.yellow
                                    : AppColors.red,
                            value: sliderValue,
                            onChangeEnd: (newValue) =>
                                widget.onAverageChanged(newValue.round()),
                            onChanged: (newValue) {
                              setState(() {
                                sliderValue = newValue;
                              });
                            }),
                      ),
                      Spacer(
                        flex: 15,
                      ),
                      Expanded(
                          flex: 35,
                          child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                color: sliderValue <= 50
                                    ? AppColors.green
                                    : sliderValue <= 80
                                        ? AppColors.yellow
                                        : AppColors.red,
                                child: AutoSizeText(
                                  sliderValue.round().toString(),
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ))),
                    ],
                  ),
                ),
              ],
            )
          : null,
    );
  }
}
