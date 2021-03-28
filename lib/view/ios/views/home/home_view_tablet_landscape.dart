import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/viewmodel/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeViewTabletLandscape extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeViewModel, SizingInformation>(
        builder: (context, model, sizingInformation, child) {
          return Center(
            child: Container(
              color: AppColors.yellow,
              child: Text(this.toStringShort()),
            ),
          );
        }
    );
  }
}