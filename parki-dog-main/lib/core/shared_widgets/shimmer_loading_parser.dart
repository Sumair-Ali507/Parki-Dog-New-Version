import 'package:parki_dog/core/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingParser extends StatelessWidget {
  final ViewOrientation orientation;
  final double cellWidth;
  final double cellAspectRatio;
  final double radius;
  final Color baseColor;
  final Color highlightColor;
  final double padding;
  final Axis scrollDirection;
  final double margin;

  const ShimmerLoadingParser({
    super.key,
    required this.orientation,
    required this.cellWidth,
    required this.cellAspectRatio,
    this.radius = 8.0,
    this.margin = 8.0,
    this.baseColor = Colors.grey,
    this.highlightColor = Colors.white,
    this.padding = 0,
    this.scrollDirection = Axis.vertical,
  });

  double get cellHeight => cellWidth / cellAspectRatio;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(padding),
      scrollDirection: scrollDirection,
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: _buildShimmerContent(),
      ),
    );
  }

  Widget _buildShimmerContent() {
    switch (orientation) {
      case ViewOrientation.orientationVertical:
        return Column(
          children: _buildShimmerItems(),
        );
      case ViewOrientation.orientationHorizontal:
        return Row(
          children: _buildShimmerItems(),
        );
      case ViewOrientation.orientationGrid:
        return Center(
          child: Wrap(
            spacing: margin,
            runSpacing: margin,
            children: _buildShimmerItems(),
          ),
        );
      case ViewOrientation.orientationFlexibleRow:
        return Row(
          children: _buildFlexibleShimmerItems(),
        );
      default:
        return Container();
    }
  }

  List<Widget> _buildShimmerItems() {
    return List.generate(20, (index) {
      return Container(
        width: cellWidth,
        height: cellHeight,
        margin: EdgeInsets.all(margin),
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(radius),
        ),
      );
    });
  }

  List<Widget> _buildFlexibleShimmerItems() {
    return List.generate(20, (index) {
      return Flexible(
        child: Container(
          width: cellWidth,
          height: cellHeight,
          margin: EdgeInsets.all(margin),
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      );
    });
  }
}
