import 'package:flutter/material.dart';

class InGameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(this.toStringShort() + " -- Android"),
      ),
    );
  }
}
