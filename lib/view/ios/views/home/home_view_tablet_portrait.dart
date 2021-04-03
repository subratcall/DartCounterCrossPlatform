import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/viewmodel/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class HomeViewTabletPortrait extends StatelessWidget {
  final HomeViewModel model;

  HomeViewTabletPortrait(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.red,
      child: Center(
        child: Text('${this.toStringShort()} -- IOS'),
      ),
    );
  }
}
