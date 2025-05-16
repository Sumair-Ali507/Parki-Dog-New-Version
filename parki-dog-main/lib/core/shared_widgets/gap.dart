//Gap
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Gap extends StatelessWidget {
  final double space;

  const Gap(
    this.space, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final parentWidget = context.findAncestorWidgetOfExactType<Row>() ??
        context.findAncestorWidgetOfExactType<Column>();
    final isRow = parentWidget is Row;
    return SizedBox(
        width: isRow ? space.w : null, height: isRow ? null : space.h);
  }
}

class Gap2 extends StatelessWidget {
  final double space;

  const Gap2(this.space, {super.key});

  @override
  Widget build(BuildContext context) {
    // Default to vertical space
    bool isVertical = true;

    // Check if the parent is a Flex widget (Row or Column)
    final flexParent = context.findAncestorWidgetOfExactType<Flex>();
    if (flexParent != null) {
      isVertical = flexParent.direction == Axis.vertical;
    }

    // Check if the parent is a ListView
    final listViewParent = context.findAncestorWidgetOfExactType<ListView>();
    if (listViewParent != null) {
      isVertical = listViewParent.scrollDirection == Axis.vertical;
    }

    // Check if the parent is a GridView
    final gridViewParent = context.findAncestorWidgetOfExactType<GridView>();
    if (gridViewParent != null) {
      isVertical = gridViewParent.scrollDirection == Axis.vertical;
    }

    // Check if the parent is a Wrap
    final wrapParent = context.findAncestorWidgetOfExactType<Wrap>();
    if (wrapParent != null) {
      isVertical = wrapParent.direction == Axis.vertical;
    }

    // Check if the parent is a SingleChildScrollView
    final singleChildScrollViewParent =
        context.findAncestorWidgetOfExactType<SingleChildScrollView>();
    if (singleChildScrollViewParent != null) {
      isVertical = singleChildScrollViewParent.scrollDirection == Axis.vertical;
    }

    // Return the appropriate sized box
    return isVertical ? SizedBox(height: space.h) : SizedBox(width: space.w);
  }
}
