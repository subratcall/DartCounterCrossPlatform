import 'package:dart_counter/app_routes.dart';
import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_icons.dart';
import 'package:dart_counter/view/ios/views/checkout_details_view.dart';
import 'package:dart_counter/view/ios/views/in_game_stats_view.dart';
import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/view/ios/widgets/button/primary_button.dart';
import 'package:dart_counter/view/ios/widgets/button/primary_text_button.dart';
import 'package:dart_counter/view/view_model_provider.dart';
import 'package:dart_counter/viewmodel/in_game_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class InGameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<InGameViewModel>(
      builder: (context, model, child) => View(
        navigationBar: CupertinoNavigationBar(
          middle: Text('First to 5 Legs'),
          trailing: Builder(
            builder: (context) => CupertinoButton(
              padding: EdgeInsets.zero,
              child: Icon(CupertinoIcons.chart_bar_fill, size: 35),
              onPressed: () => CupertinoScaffold.showCupertinoModalBottomSheet(
                expand: true,
                context: context,
                backgroundColor: AppColors.transparent,
                builder: (context) => InGameStatsView(),
              ),
            ),
          ),
        ),
        child: Row(
          children: [
            Spacer(
              flex: 8,
            ),
            Expanded(
              flex: 359,
              child: Column(
                children: [
                  Spacer(
                    flex: 4,
                  ),
                  Expanded(
                    flex: 318,
                    child: Placeholder(),
                  ),
                  Spacer(
                    flex: 4,
                  ),
                  Expanded(
                    flex: 64,
                    child: InputRow(model),
                  ),
                  Spacer(
                    flex: 4,
                  ),
                  Expanded(
                    flex: 289,
                    child: KeyBoard(model),
                  ),
                  Spacer(
                    flex: 4,
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 8,
            ),
          ],
        ),
      ),
    );
  }
}

class InputRow extends StatelessWidget {

  final InGameViewModel model;

  InputRow(this.model);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 104,
          child: CupertinoButton(
            color: AppColors.red,
            onPressed: () => model.onUndoPressed(),
            padding: EdgeInsets.zero,
            child: Icon(CupertinoIcons.arrow_left, size: 35),
          ),
        ),
        Spacer(
          flex: 4,
        ),
        Expanded(
          flex: 146,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              color: AppColors.gray,
            ),
          ),
        ),
        Spacer(
          flex: 4,
        ),
        Expanded(
          flex: 104,
          child: CupertinoButton(
            color: AppColors.green,
            onPressed: () {
              model.onPerformThrowPressed();
              // TODO remove this line
              Navigator.pushNamed(context, AppRoutes.postGame);
            },
            padding: EdgeInsets.zero,
            child: Icon(CupertinoIcons.arrow_right, size: 35),
          ),
        ),
      ],
    );
  }
}

class KeyBoard extends StatelessWidget {

  final InGameViewModel model;

  KeyBoard(this.model);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 70,
          child: Row(
            children: [
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                  text: '1',
                  borderRadius:  const BorderRadius.all(Radius.circular(8.0)),
                  onPressed: () => model.onKeyPressed('1'),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                  text: '2',
                  borderRadius:  const BorderRadius.all(Radius.circular(8.0)),
                  onPressed: () => model.onKeyPressed('2'),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                  text: '3',
                  borderRadius:  const BorderRadius.all(Radius.circular(8.0)),
                  onPressed: () => model.onKeyPressed('3'),
                ),
              ),
            ],
          ),
        ),
        Spacer(
          flex: 4,
        ),
        Expanded(
          flex: 70,
          child: Row(
            children: [
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                  borderRadius:  const BorderRadius.all(Radius.circular(8.0)),
                  text: '4',
                  onPressed: () => model.onKeyPressed('4'),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                  borderRadius:  const BorderRadius.all(Radius.circular(8.0)),
                  text: '5',
                  onPressed: () => model.onKeyPressed('5'),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                  borderRadius:  const BorderRadius.all(Radius.circular(8.0)),
                  text: '6',
                  onPressed: () => model.onKeyPressed('6'),
                ),
              ),
            ],
          ),
        ),
        Spacer(
          flex: 4,
        ),
        Expanded(
          flex: 70,
          child: Row(
            children: [
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                  text: '7',
                  borderRadius:  const BorderRadius.all(Radius.circular(8.0)),
                  onPressed: () => model.onKeyPressed('7'),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                  text: '8',
                  borderRadius:  const BorderRadius.all(Radius.circular(8.0)),
                  onPressed: () => model.onKeyPressed('8'),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                  text: '9',
                  borderRadius:  const BorderRadius.all(Radius.circular(8.0)),
                  onPressed: () => model.onKeyPressed('9'),
                ),
              ),
            ],
          ),
        ),
        Spacer(
          flex: 4,
        ),
        Expanded(
          flex: 70,
          child: Row(
            children: [
              Expanded(
                flex: 117,
                child: Builder(
                  builder: (context) => PrimaryTextButton(
                    text: 'Check',
                    onPressed: () {
                      model.onKeyPressed('check');
                      CupertinoScaffold.showCupertinoModalBottomSheet(
                        expand: true,
                        context: context,
                        backgroundColor: AppColors.transparent,
                        builder: (context) => CheckoutDetailsView(),
                      );
                    },
                    borderRadius:  const BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                  text: '0',
                  onPressed: () => model.onKeyPressed('0'),
                  borderRadius:  const BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 117,
                child: PrimaryButton(
                  borderRadius:  const BorderRadius.all(Radius.circular(8.0)),
                  onPressed: () => model.onKeyPressed('erase'),
                  child: Icon(AppIcons.erase, size: 35),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
