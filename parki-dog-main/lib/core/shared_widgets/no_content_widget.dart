import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parki_dog/core/utils/text_styles.dart';
import 'package:parki_dog/core/utils/values_manager.dart';

class NoContentWidget extends StatelessWidget {
  final String text;
  final String assetName;
  const NoContentWidget(
      {super.key, required this.text, required this.assetName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(assetName),
          const SizedBox(height: AppDouble.d16),
          Text(
            text,
            style: TextStyles.font16PrimaryMedium(),
          ).tr(),
        ],
      ),
    );
  }
}
