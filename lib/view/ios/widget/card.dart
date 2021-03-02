import 'package:flutter/cupertino.dart';

class Card {
  final Widget leading;
  final Widget middle;
  final Widget trailing;
  final Widget body;
  final BorderRadius borderRadius;

  Card(
      {this.leading,
      this.middle,
      this.trailing,
      this.body,
      this.borderRadius = const BorderRadius.all(Radius.circular(8.0))})
      : assert(body != null);

  @override
  Widget build(BuildContext context) {}
}
