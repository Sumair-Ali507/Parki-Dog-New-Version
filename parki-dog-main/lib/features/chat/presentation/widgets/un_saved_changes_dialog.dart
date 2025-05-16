import 'package:parki_dog/features/chat/export/chat_export.dart';

Future<dynamic> unSavedChangesDialog(
  BuildContext context, {
  VoidCallback? confirmOnTap,
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
                  color: ColorsManager.secondary500,
                  assetName: ImageAssets.save)),
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
          LocaleKeys.chat_unsavedChanges,
          textAlign: TextAlign.start,
          style: TextStyles.font18NavyBlueDarkMedium(),
        ).tr(),
        const SizedBox(height: AppDouble.d4),
        Text(
          LocaleKeys.chat_wantToSaveOrDiscard,
          textAlign: TextAlign.start,
          style: TextStyles.font14Grey400Regular(),
        ).tr(),
        const SizedBox(height: AppDouble.d16),
        SizedBox(
          width: AppDouble.d1.sw,
          child: ElevatedButton(
              onPressed: confirmOnTap,
              child: const Text(LocaleKeys.chat_confirm).tr()),
        ),
        const SizedBox(height: AppDouble.d12),
        SizedBox(
          width: AppDouble.d1.sw,
          child: OutlinedButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              LocaleKeys.chat_cancel,
              style: TextStyles.font16Grey600Medium(),
            ).tr(),
          ),
        ),
      ],
    ),
  );
}
