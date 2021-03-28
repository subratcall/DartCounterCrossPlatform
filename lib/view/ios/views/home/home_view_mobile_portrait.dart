import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/viewmodel/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeViewMobilePortrait extends StatelessWidget {

  final HomeViewModel2 model2 = HomeViewModel2Impl();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: AppColors.blue,
        child: MyButton(
          inputText: model2.inputText,
          outputText: model2.outputText,
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {

  /// IN
  final Sink<String> inputText;

  /// OUT
  final Stream<String> outputText;


  MyButton({this.inputText, this.outputText});

  @override
  Widget build(BuildContext context) {
    return Consumer<SizingInformation>(
        builder: (context, sizingInformation, child) {
          return CupertinoButton(
            child: StreamBuilder<String>(
                initialData: 'Initial',
                stream: outputText,
                builder: (context, snapshot) => Text(snapshot.data)
            ),
            onPressed: () => inputText.add('Pressed'),
          );
        }
    );

  }
}
