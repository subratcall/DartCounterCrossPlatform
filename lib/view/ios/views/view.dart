import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_builder/responsive_builder.dart';

class View extends StatefulWidget {

  final VoidCallback onTap;

  final CupertinoNavigationBar navigationBar;
  final Widget mobilePortrait;
  final Widget mobileLandscape;
  final Widget tabletPortrait;
  final Widget tabletLandscape;

  View({this.onTap, this.navigationBar, this.mobilePortrait, this.mobileLandscape, this.tabletLandscape, this.tabletPortrait});

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: CupertinoPageScaffold(
        navigationBar: widget.navigationBar,
        child: GestureDetector(
          onTap: widget.onTap,
          child: SafeArea(
            child: OrientationLayoutBuilder(
              portrait: (BuildContext context) => ScreenTypeLayout.builder(
                mobile: (context) => widget.mobilePortrait,
                tablet: (context) => widget.tabletPortrait,
              ),
              landscape:(BuildContext context) => ScreenTypeLayout.builder(
                mobile: (context) => widget.mobileLandscape,
                tablet: (context) => widget.tabletLandscape,
              ),
            ),
          ),
        ),
      ),
    );
  }
}