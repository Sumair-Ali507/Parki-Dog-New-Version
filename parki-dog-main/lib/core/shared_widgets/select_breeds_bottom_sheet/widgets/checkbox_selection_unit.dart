import 'package:flutter/material.dart';
import 'package:parki_dog/core/extensions/extenstions.dart';
import 'package:parki_dog/core/utils/colors_manager.dart';
import 'package:parki_dog/core/utils/text_styles.dart';
import 'package:parki_dog/core/utils/values_manager.dart';

class CheckboxSelectionUnit extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;
  final String text;

  const CheckboxSelectionUnit({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDouble.d16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDouble.d16),
        child: Container(
          padding: const EdgeInsets.all(AppDouble.d16),
          decoration: BoxDecoration(
              color: ColorsManager.grey50,
              borderRadius: BorderRadius.circular(AppDouble.d16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    text.capitalizeFirst(),
                    maxLines: AppInt.i1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font16Grey600Medium(),
                  )),
              Container(
                height: AppDouble.d18,
                width: AppDouble.d18,
                // padding: const EdgeInsets.all(AppDouble.d5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDouble.d3),
                    border: Border.all(
                        color: isSelected
                            ? ColorsManager.secondaryColor
                            : ColorsManager.grey500,
                        width: AppDouble.d2)),
                child: isSelected
                    ? const Center(
                        child: Icon(
                        Icons.check,
                        color: ColorsManager.secondaryColor,
                        size: AppDouble.d14,
                      ))
                    : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
