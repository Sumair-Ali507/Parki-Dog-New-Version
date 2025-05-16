import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showAppSnackBar(
    BuildContext context,
    {required String content,
    bool isLocalized = true}) {
  return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: isLocalized ? Text(content).tr() : Text(content)));
}
