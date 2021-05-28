import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final double opacity;
  final Alignment alignment;
  final String image;
  final double height;
  final double width;

  const ImageWidget({
    Key? key,
    required this.opacity,
    required this.alignment,
    required this.image,
    required this.height,
    required this.width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Align(
        alignment: alignment,
        child: Image.asset(image, height: height, width: width),
      ),
    );
  }
}
