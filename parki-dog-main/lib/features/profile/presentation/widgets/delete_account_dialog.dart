import 'package:parki_dog/features/profile/export/profile_export.dart';

Future<dynamic> deleteAccountDialog(BuildContext context) {
  return showAppDialog(
    context,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: ColorsManager.borderLightRed, width: AppDouble.d8),
          ),
          child: const CircleAvatar(
              backgroundColor: ColorsManager.red100,
              child: SvgIcon(
                  color: ColorsManager.red600, assetName: ImageAssets.delete)),
        ),
        IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const AppIcon(
                assetName: ImageAssets.close, color: ColorsManager.iconDefault))
      ],
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.profile_deleteAccount,
          textAlign: TextAlign.start,
          style: TextStyles.font18NavyBlueDarkMedium(),
        ).tr(),
        const SizedBox(height: AppDouble.d4),
        Text(
          LocaleKeys.profile_sureDeleteAccount,
          textAlign: TextAlign.start,
          style: TextStyles.font14Grey400Regular(),
        ).tr(),
        const SizedBox(height: AppDouble.d16),
        SizedBox(
          width: AppDouble.d1.sw,
          child: ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: const Text(LocaleKeys.profile_cancel).tr()),
        ),
        const SizedBox(height: AppDouble.d12),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {},
            child: Text(LocaleKeys.profile_delete,
                    style: TextStyles.font16Red600Medium())
                .tr(),
          ),
        ),
      ],
    ),
  );
}
