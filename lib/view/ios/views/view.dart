import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CupertinoView extends StatelessWidget {
  final CupertinoNavigationBar navigationBar;
  final EdgeInsets padding;
  final Widget child;
  final VoidCallback onTap;

  CupertinoView({this.navigationBar, this.padding = const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0), this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: CupertinoPageScaffold(
        navigationBar: navigationBar,
        child: GestureDetector(
          onTap: onTap,
          child: SafeArea(
            child: Padding(padding: padding, child: child),
          ),
        ),
      ),
    );
  }
}
