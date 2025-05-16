import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parki_dog/core/shared_widgets/svg_icon.dart';
import 'package:parki_dog/core/utils/colors_manager.dart';
import 'package:parki_dog/core/utils/text_styles.dart';
import 'package:parki_dog/core/utils/values_manager.dart';
import 'package:parki_dog/generated/locale_keys.g.dart';

class SignInAndSecurityItem extends StatelessWidget {
  final bool isPassword;
  final String imageAsset;
  final String title;
  final String? mail;
  final String? date;
  final VoidCallback? onTap;

  const SignInAndSecurityItem({
    super.key,
    required this.isPassword,
    required this.imageAsset,
    required this.title,
    this.mail,
    this.date,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppDouble.d16),
      decoration: const BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(
        color: ColorsManager.grey100,
        width: AppDouble.d1,
      ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: ColorsManager.grey100,
                radius: AppDouble.d24,
                child: SvgIcon(
                    color: ColorsManager.grey700, assetName: imageAsset),
              ),
              const SizedBox(width: AppDouble.d8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyles.font12Grey400Regular(),
                  ).tr(),
                  if (isPassword && date != null)
                    Container(
                      constraints: BoxConstraints(
                          maxWidth: AppDouble.d1.sw - AppDouble.d165),
                      child: Text(
                        LocaleKeys.signInAndSecurity_lastUpdate
                            .tr(args: [date!]),
                        style: TextStyles.font14Grey600Regular(),
                        maxLines: AppInt.i1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  if (!isPassword && mail != null)
                    Container(
                      constraints: BoxConstraints(
                          maxWidth: AppDouble.d1.sw - AppDouble.d165),
                      child: Text(
                        mail!,
                        style: TextStyles.font14Grey600Regular(),
                        maxLines: AppInt.i1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              )
            ],
          ),
          TextButton(
              onPressed: onTap,
              child: const Text(
                LocaleKeys.signInAndSecurity_change,
              ).tr())
        ],
      ),
    );
  }
}
