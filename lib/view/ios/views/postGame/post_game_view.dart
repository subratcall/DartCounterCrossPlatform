import 'package:dart_counter/view/ios/views/view.dart';
import 'package:dart_counter/viewmodel/post_game_viewmodel.dart';
import 'package:flutter/cupertino.dart';

import 'post_game_view_mobile_portrait.dart';

class PostGameView extends StatelessWidget {

  final PostGameViewModel model = PostGameViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return View(
      navigationBar: CupertinoNavigationBar(
        middle: Text('TODO'),
      ),
      mobilePortrait: PostGameViewMobilePortrait(model),
    );
  }
}