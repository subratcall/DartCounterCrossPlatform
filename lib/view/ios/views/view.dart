import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class View extends StatelessWidget {
  final CupertinoNavigationBar navigationBar;
  final Widget child;
  final VoidCallback onTap;

  View({this.navigationBar, this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    // Params to calc contentview width and height
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double paddingTop = MediaQuery.of(context).padding.top;
    final double navbarHeight =
        navigationBar != null ? navigationBar.preferredSize.height : 0;
    final double paddingBottom = MediaQuery.of(context).padding.bottom;

    return CupertinoScaffold(
      body: CupertinoPageScaffold(
        navigationBar: navigationBar,
        child: GestureDetector(
          onTap: onTap,
          child: SafeArea(
            child: MediaQuery(
              data: MediaQueryData(
                size: Size(
                    width, height - paddingTop - navbarHeight - paddingBottom),
              ),
              child: SizedBox(
                width: width,
                height: height - paddingTop - navbarHeight - paddingBottom,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
