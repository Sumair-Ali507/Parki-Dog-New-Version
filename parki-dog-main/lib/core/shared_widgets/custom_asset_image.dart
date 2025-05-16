import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget {
  final double width;
  final double? height;
  final double cellAspectRatio;
  final String image;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final BoxShape shape;

  const CustomImageWidget({
    super.key,
    required this.width,
    this.height,
    required this.cellAspectRatio,
    required this.image,
    this.fit,
    this.borderRadius,
    this.boxShadow,
    this.shape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    double cellHeight = height ?? (width / cellAspectRatio);

    return Container(
      width: width,
      height: cellHeight,
      decoration: BoxDecoration(
        shape: shape,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
      ),
      child: AspectRatio(
          aspectRatio: cellAspectRatio,
          child: Image.asset(
            image,
            fit: fit ?? BoxFit.cover,
          )),
    );
  }
}
