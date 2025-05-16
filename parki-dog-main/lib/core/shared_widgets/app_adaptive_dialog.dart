import 'package:flutter/material.dart';

Future<dynamic> appAdaptiveDialog(
  BuildContext context, {
  Widget? title,
  Widget? content,
  List<Widget>? actions,
  bool isDismissible = true,
  Color? bgColor,
  Color? surfaceTintColor,
}) {
  return showAdaptiveDialog(
    context: context,
    builder: (context) => AlertDialog.adaptive(
      backgroundColor: bgColor,
      surfaceTintColor: surfaceTintColor,
      title: title,
      content: content,
      actions: actions,
    ),
    barrierDismissible: isDismissible,
  );
}
