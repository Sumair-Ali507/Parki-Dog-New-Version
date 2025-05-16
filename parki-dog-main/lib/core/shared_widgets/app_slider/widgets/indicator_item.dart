import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:parki_dog/core/utils/colors_manager.dart';
import 'package:parki_dog/core/utils/values_manager.dart';

class IndicatorItem extends StatelessWidget {
  final CarouselSliderController carouselController;
  final int currentIndex;
  final MapEntry<int, String> entry;

  const IndicatorItem(
      {super.key,
      required this.carouselController,
      required this.currentIndex,
      required this.entry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDouble.d6),
      child: InkWell(
        onTap: () => carouselController.animateToPage(entry.key),
        child: Container(
          width: currentIndex == entry.key ? AppDouble.d20 : AppDouble.d8,
          height: AppDouble.d8,
          margin: const EdgeInsets.all(AppDouble.d2),
          decoration: BoxDecoration(
              shape: currentIndex == entry.key
                  ? BoxShape.rectangle
                  : BoxShape.circle,
              borderRadius: currentIndex == entry.key
                  ? BorderRadius.circular(AppDouble.d23)
                  : null,
              color: ColorsManager.white),
        ),
      ),
    );
  }
}
