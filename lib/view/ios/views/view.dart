import 'package:dart_counter/locator.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

/// root widget of every ios view

class View<T extends ViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;

  View({this.builder, this.onModelReady});

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
    return ChangeNotifierProvider<T>(
        create: (context) => model,
        child: Consumer<T>(builder: widget.builder));
  }
}
