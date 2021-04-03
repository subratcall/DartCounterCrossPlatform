import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/assets/app_icons.dart';
import 'package:dart_counter/view/ios/sharedWidgets/buttons/primary_button.dart';
import 'package:dart_counter/view/ios/sharedWidgets/buttons/primary_text_button.dart';
import 'package:dart_counter/view/ios/views/checkoutdetails/checkout_details_view.dart';
import 'package:dart_counter/viewmodel/enum/key_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class KeyBoard extends StatelessWidget {
  final Function(KeyType) onKeyPressed;

  KeyBoard({this.onKeyPressed}) : assert(onKeyPressed != null);

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
                  fontSize: 45,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  onPressed: () => onKeyPressed(KeyType.one),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                  text: '2',
                  fontSize: 45,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  onPressed: () => onKeyPressed(KeyType.two),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                    text: '3',
                    fontSize: 45,
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    onPressed: () => onKeyPressed(KeyType.three)),
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
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  text: '4',
                  fontSize: 45,
                  onPressed: () => onKeyPressed(KeyType.four),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  text: '5',
                  fontSize: 45,
                  onPressed: () => onKeyPressed(KeyType.five),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  text: '6',
                  fontSize: 45,
                  onPressed: () => onKeyPressed(KeyType.six),
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
                  fontSize: 45,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  onPressed: () => onKeyPressed(KeyType.seven),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                  text: '8',
                  fontSize: 45,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  onPressed: () => onKeyPressed(KeyType.eight),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 117,
                child: PrimaryTextButton(
                  text: '9',
                  fontSize: 45,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  onPressed: () => onKeyPressed(KeyType.nine),
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
                    fontSize: 45,
                    onPressed: () {
                      onKeyPressed(KeyType.check);
                      CupertinoScaffold.showCupertinoModalBottomSheet(
                        expand: true,
                        context: context,
                        backgroundColor: AppColors.transparent,
                        builder: (context) => CheckoutDetailsView(),
                      );
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
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
                  fontSize: 45,
                  onPressed: () => onKeyPressed(KeyType.zero),
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Expanded(
                flex: 117,
                child: PrimaryButton(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    onPressed: () => onKeyPressed(KeyType.erase),
                    builder: (context, boxConstraints) {
                      return Icon(AppIcons.erase, size: 35);
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
