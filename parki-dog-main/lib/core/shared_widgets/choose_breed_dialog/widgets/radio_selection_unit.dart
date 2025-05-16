import 'package:flutter/material.dart';
import 'package:parki_dog/core/utils/colors_manager.dart';
import 'package:parki_dog/core/utils/text_styles.dart';
import 'package:parki_dog/core/utils/values_manager.dart';

class RadioSelectionUnit extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;
  final String text;

  const RadioSelectionUnit({
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
                    text,
                    maxLines: AppInt.i1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font16Grey600Medium(),
                  )),
              Container(
                height: AppDouble.d24,
                width: AppDouble.d24,
                padding: const EdgeInsets.all(AppDouble.d5),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: isSelected
                            ? ColorsManager.secondaryColor
                            : ColorsManager.grey500,
                        width: AppDouble.d2),
                    shape: BoxShape.circle),
                child: isSelected
                    ? Container(
                        height: AppDouble.d9,
                        width: AppDouble.d9,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorsManager.secondaryColor),
                      )
                    : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
