import 'package:flutter/cupertino.dart';

class CircleImage extends StatelessWidget {
  final DecorationImage image;

  CircleImage(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: image,
      ),
    );
  }
}
