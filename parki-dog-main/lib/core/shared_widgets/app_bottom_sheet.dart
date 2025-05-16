import 'package:parki_dog/core/extensions/extenstions.dart';
import 'package:parki_dog/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

//DraggableScrollableSheet in builder to expand bottom sheet to take full screen by dragging it up
Future<dynamic> buildAppBottomSheet(
  BuildContext context, {
  required Widget content,
  Color? backgroundColor,
  double radius = AppDouble.d1,
  bool isDismissible = true,
  double heightFactor = AppDouble.d0_5,
}) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: backgroundColor,
    isDismissible: isDismissible,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      ),
    ),
    constraints: BoxConstraints(
      maxWidth: context.width,
      minWidth: context.width,
    ),
    builder: (context) =>
        FractionallySizedBox(heightFactor: heightFactor, child: content),
  );
}
