import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/viewmodel/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class HomeViewTabletLandscape extends StatelessWidget {

  final HomeViewModel model;

  HomeViewTabletLandscape(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.green,
        child: Center(
        child: Text(this.toStringShort()),
    ),
    );
  }
}