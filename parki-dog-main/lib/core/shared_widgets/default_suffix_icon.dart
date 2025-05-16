import 'package:flutter/material.dart';
import 'package:parki_dog/core/shared_widgets/app_icon.dart';
import 'package:parki_dog/core/utils/colors_manager.dart';

class DefaultSuffixIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final String assetName;
  final Color color;

  const DefaultSuffixIcon({
    super.key,
    this.onPressed,
    required this.assetName,
    this.color = ColorsManager.grey700,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: AppIcon(assetName: assetName, color: color));
  }
}
