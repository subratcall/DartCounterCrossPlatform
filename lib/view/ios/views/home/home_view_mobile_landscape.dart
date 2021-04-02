import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/viewmodel/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class HomeViewMobileLandscape extends StatelessWidget {

  final HomeViewModel model;

  HomeViewMobileLandscape(this.model);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
          final double width = boxConstraints.maxWidth;
          final double height = boxConstraints.maxHeight;
          return Container(
            color: AppColors.red,
            child: Center(
              child: Text('${this.toStringShort()} -- IOS'),
            ),
          );
        }
    );
  }
}
