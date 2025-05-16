import 'package:flutter/material.dart';
import 'package:parki_dog/core/utils/values_manager.dart';
import 'package:parki_dog/core/utils/colors_manager.dart';

class ProgressiveLine extends StatelessWidget {
  final int slotsNumber;
  final int activeSlot;

  const ProgressiveLine(
      {super.key, required this.slotsNumber, required this.activeSlot});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(slotsNumber, (index) {
      // Determine if this slot is the active slot or before the active slot
      bool isActive = index < activeSlot;
      // Apply the bottom start radius for the first slot and bottom end for the last slot
      bool isBottomStartRadius = index == AppInt.i0;
      bool isBottomEndRadius = index == slotsNumber - AppInt.i1;
      return Expanded(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: index > AppInt.i0 ? AppDouble.d4 : AppDouble.d0),
          // Add gap between slots
          child: ProgressiveLineUnit(
            color: isActive
                ? Theme.of(context).colorScheme.secondary
                : Colors.grey[300],
            isBottomStartRadius: isBottomStartRadius,
            isBottomEndRadius: isBottomEndRadius,
          ),
        ),
      );
    }));
  }
}

class ProgressiveLineUnit extends StatelessWidget {
  final Color? color;
  final bool isBottomStartRadius;
  final bool isBottomEndRadius;

  const ProgressiveLineUnit({
    super.key,
    this.color,
    required this.isBottomStartRadius,
    required this.isBottomEndRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDouble.d4,
      decoration: BoxDecoration(
          color: color ?? ColorsManager.grey200,
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: isBottomStartRadius
                ? const Radius.circular(AppDouble.d16)
                : Radius.zero,
            bottomEnd: isBottomEndRadius
                ? const Radius.circular(AppDouble.d16)
                : Radius.zero,
          )),
    );
  }
}
