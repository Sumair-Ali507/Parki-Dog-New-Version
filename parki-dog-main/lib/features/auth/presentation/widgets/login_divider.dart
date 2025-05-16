import 'package:parki_dog/features/auth/export/auth_export.dart';

class LoginDivider extends StatelessWidget {
  const LoginDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          top: AppDouble.d24, bottom: AppDouble.d16),
      child: Row(
        children: [
          Expanded(
              child: Container(
            height: AppDouble.d1,
            color: ColorsManager.dividerColor,
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDouble.d16),
            child: Text(LocaleKeys.auth_orContinueWith,
                    style: TextStyles.font14AppBlackRegular())
                .tr(),
          ),
          Expanded(
              child: Container(
            height: AppDouble.d1,
            color: ColorsManager.dividerColor,
          )),
        ],
      ),
    );
  }
}
