import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:parki_dog/core/shared_widgets/svg_icon.dart';
import 'package:parki_dog/core/utils/assets_manager.dart';
import 'package:parki_dog/core/utils/colors_manager.dart';
import 'package:parki_dog/core/utils/text_styles.dart';
import 'package:parki_dog/core/utils/values_manager.dart';

class DialogStatus extends StatelessWidget {
  final String text;
  final bool isDone;

  const DialogStatus({
    super.key,
    required this.text,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDouble.d32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isDone
              ? const CircleAvatar(
                  backgroundColor: ColorsManager.green50,
                  radius: AppDouble.d28,
                  child: SvgIcon(
                      color: ColorsManager.green600,
                      assetName: ImageAssets.checkOutlined))
              : const SpinKitCircle(
                  color: ColorsManager.primaryColor,
                ),
          const SizedBox(height: AppDouble.d16),
          Center(
              child: Text(text,
                      textAlign: TextAlign.center,
                      style: TextStyles.font20Grey700Medium())
                  .tr()),
        ],
      ),
    );
  }
}
