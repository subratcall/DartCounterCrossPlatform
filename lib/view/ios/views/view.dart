import 'package:dart_counter/assets/app_colors.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

/// root widget of every ios view

class View<T extends ViewModel> extends StatefulWidget {
  final CupertinoNavigationBar navigationBar;
  final EdgeInsets padding;
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;
  final VoidCallback onTap;

  View({this.navigationBar, this.padding = const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0), this.builder, this.onModelReady, this.onTap});

  @override
  _ViewState<T> createState() => _ViewState<T>();
}

class _ViewState<T extends ViewModel> extends State<View<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Builder(
          builder: (context) => CupertinoPageScaffold(
            navigationBar: widget.navigationBar,
            child: GestureDetector(
              onTap: widget.onTap,
              child: SafeArea(
                child: Padding(
                  padding: widget.padding,
                  child: ChangeNotifierProvider<T>(
                      create: (context) => model,
                      child: Consumer<T>(builder: widget.builder)),
                ),
              ),
            ),
          )
      ),
    );
  }
}

class ModalView<T extends ViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;


  ModalView({this.builder, this.onModelReady});

  @override
  _ModalViewState<T> createState() => _ModalViewState<T>();
}

class _ModalViewState<T extends ViewModel> extends State<ModalView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        create: (context) => model,
        child: Consumer<T>(builder: widget.builder));
  }
}
