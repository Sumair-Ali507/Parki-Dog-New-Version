import 'package:parki_dog/features/select_language/export/select_language_export.dart';

Future<dynamic> changeLanguageDialog(
  BuildContext context, {
  VoidCallback? changeLanguageOnTap,
  required String languageName,
}) {
  return showAppDialog(
    context,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: ColorsManager.lightYellow, width: AppDouble.d8),
          ),
          child: const CircleAvatar(
              backgroundColor: ColorsManager.secondary100,
              child: SvgIcon(
                  color: ColorsManager.secondary400,
                  assetName: ImageAssets.globe)),
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
          LocaleKeys.language_changeLanguage,
          textAlign: TextAlign.start,
          style: TextStyles.font18NavyBlueDarkMedium(),
        ).tr(),
        const SizedBox(height: AppDouble.d4),
        Text(
          LocaleKeys.language_wantChangeLanguage.tr(args: [languageName]),
          textAlign: TextAlign.start,
          style: TextStyles.font14Grey400Regular(),
        ).tr(),
        const SizedBox(height: AppDouble.d16),
        SizedBox(
          width: AppDouble.d1.sw,
          child: ElevatedButton(
              onPressed: changeLanguageOnTap,
              child: const Text(LocaleKeys.language_change).tr()),
        ),
        const SizedBox(height: AppDouble.d12),
        SizedBox(
          width: AppDouble.d1.sw,
          child: OutlinedButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              LocaleKeys.language_cancel,
              style: TextStyles.font16Grey600Medium(),
            ).tr(),
          ),
        ),
      ],
    ),
  );
}
