import 'package:dart_counter/viewmodel/post_game_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class PostGameViewMobilePortrait extends StatelessWidget {

  final PostGameViewModel model;

  PostGameViewMobilePortrait(this.model);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
          final double width = boxConstraints.maxWidth;
          final double height = boxConstraints.maxHeight;
          return Center(
            child: Text(this.toStringShort() + " -- IOS"),
          );
        }
    );
  }
}