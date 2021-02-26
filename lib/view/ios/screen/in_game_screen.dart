import 'package:dart_counter/app_state.dart';
import 'package:dart_counter/routes.dart';
import 'package:dart_counter/view/ios/modals/modal_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class InGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoScaffold(
        body: Builder(
          builder: (context) => CupertinoPageScaffold(
            backgroundColor: Colors.white,
            navigationBar: CupertinoNavigationBar(
              leading: CupertinoButton(
                padding: EdgeInsets.zero,
                child: Icon(CupertinoIcons.chevron_back, size: 35),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              middle: Text('First to 5 Legs'),
              trailing: CupertinoButton(
                padding: EdgeInsets.zero,
                child: Icon(CupertinoIcons.chart_bar_fill, size: 35),
                onPressed: () => CupertinoScaffold
                    .showCupertinoModalBottomSheet(
                  expand: true,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => Stack(
                    children: <Widget>[
                      ModalWithScroll(),
                      Positioned(
                        height: 40,
                        left: 40,
                        right: 40,
                        bottom: 20,
                        child: MaterialButton(
                          onPressed: () => Navigator.of(
                              context)
                              .popUntil((route) =>
                          route.settings.name == '/'),
                          child: Text('Pop back home'),
                        ),
                      )
                    ],
                  ),
                )),
            ),
            child: Center(
                child: Column(
                  children: [
                    CupertinoButton(
                        child: Text('CheckoutDetails'),
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.checkoutDetails);
                        }),
                  ],
                )
            ),
          ),
        ),
      )
    );

    return Consumer<AppState>(builder: (context, state, child) {
      return Scaffold(
          body: CupertinoScaffold(
              body: Builder(
                builder: (context) => CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(
                      leading: CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Icon(CupertinoIcons.chevron_back, size: 35),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      middle: Text("First to 5 Legs"),
                      trailing: CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: Icon(CupertinoIcons.chart_bar_fill, size: 35),
                          onPressed: () =>
                              CupertinoScaffold.showCupertinoModalBottomSheet(
                                expand: true,
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) => Stack(
                                  children: <Widget>[
                                    ModalWithScroll(),
                                  ],
                                ),
                              )),
                    ),
                    child: Column(children: [
                      CupertinoButton(
                          child: Text('CheckoutDetails'),
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.checkoutDetails);
                          }),
                    ])),
              ))
      );
    });
  }
}
