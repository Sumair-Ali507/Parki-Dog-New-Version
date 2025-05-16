import 'package:flutter/material.dart';
import 'package:parki_dog/core/utils/colors_manager.dart';
import 'package:parki_dog/core/utils/text_styles.dart';
import 'package:parki_dog/core/utils/values_manager.dart';

void showTopSnackBar(BuildContext context,
    {required String message, bool isGreen = true}) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => PositionedDirectional(
      top: MediaQuery.of(context).padding.top +
          AppDouble.d10, // Adjust for status bar
      start: AppDouble.d20,
      end: AppDouble.d20,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDouble.d16, vertical: AppDouble.d12),
          decoration: BoxDecoration(
            color: isGreen ? ColorsManager.green100 : ColorsManager.red100,
            borderRadius: BorderRadius.circular(AppDouble.d16),
            boxShadow: [
              BoxShadow(
                color: ColorsManager.black.withOpacity(AppDouble.d0_15),
                blurRadius: AppDouble.d8,
                offset: const Offset(AppDouble.d4, AppDouble.d4),
              ),
            ],
          ),
          child: Text(
            message,
            style: TextStyles.font16Green800MediumRoboto(
                color: isGreen ? ColorsManager.green800 : ColorsManager.red600),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );

  // Insert the overlay entry
  overlay.insert(overlayEntry);

  // Remove the overlay after a delay
  Future.delayed(const Duration(seconds: AppInt.i3), () {
    overlayEntry.remove();
  });
}
