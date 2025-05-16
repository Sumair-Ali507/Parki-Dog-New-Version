import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:parki_dog/core/shared_widgets/svg_icon.dart';
import 'package:parki_dog/core/utils/colors_manager.dart';
import 'package:parki_dog/core/utils/text_styles.dart';
import 'package:parki_dog/core/utils/values_manager.dart';

class DialogButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color color;
  final String text;
  final String assetName;
  final bool isTextArguments;

  const DialogButton(
      {super.key,
      this.onTap,
      this.color = ColorsManager.grey700,
      required this.text,
      required this.assetName,
      this.isTextArguments = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDouble.d16),
      child: Container(
        padding: const EdgeInsets.all(AppDouble.d18),
        decoration: BoxDecoration(
          color: ColorsManager.grey50,
          borderRadius: BorderRadius.circular(AppDouble.d16),
        ),
        child: Row(
          children: [
            SvgIcon(color: color, assetName: assetName),
            const SizedBox(width: AppDouble.d8),
            isTextArguments
                ? Text(
                    text,
                    style: TextStyles.font16Grey700Medium(color: color),
                  )
                : Text(
                    text,
                    style: TextStyles.font16Grey700Medium(color: color),
                  ).tr(),
          ],
        ),
      ),
    );
  }
}
