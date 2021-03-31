import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:responsive_builder/responsive_builder.dart';

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

class View2 extends StatefulWidget {

  final VoidCallback onTap;

  final CupertinoNavigationBar navigationBar;
  final Widget mobilePortrait;
  final Widget mobileLandscape;
  final Widget tabletPortrait;
  final Widget tabletLandscape;

  View2({this.onTap, this.navigationBar, this.mobilePortrait, this.mobileLandscape, this.tabletLandscape, this.tabletPortrait});

  @override
  _View2State createState() => _View2State();
}

class _View2State extends State<View2> {

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