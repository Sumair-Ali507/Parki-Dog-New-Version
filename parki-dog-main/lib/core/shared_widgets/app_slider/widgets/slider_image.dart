import 'package:flutter/material.dart';
import 'package:parki_dog/core/shared_widgets/image_view_widget2.dart';
import 'package:parki_dog/core/utils/values_manager.dart';

class SliderImage extends StatelessWidget {
  final String item;
  final double width;
  final double borderRadius;
  final BoxFit fit;

  const SliderImage(
      {super.key,
      required this.item,
      required this.width,
      required this.borderRadius,
      required this.fit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(end: AppDouble.d4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Theme.of(context).colorScheme.secondaryFixed,
        // color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: ImageViewWidget2(
        imageUrl: item,
        fit: fit,
        width: width,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
