import 'package:parki_dog/features/home/export/home_export.dart';

Future<dynamic> dogCheckOutPopup(
  BuildContext context, {
  required VoidCallback? confirmOnTap,
}) {
  return showAppDialog(context,
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
                    color: ColorsManager.redIcon,
                    assetName: ImageAssets.cancel)),
          ),
          IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const AppIcon(
                  assetName: ImageAssets.close,
                  color: ColorsManager.iconDefault))
        ],
      ),
      content: SizedBox(
        width: AppDouble.d1.sw,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.home_checkingOut,
              textAlign: TextAlign.start,
              style: TextStyles.font18NavyBlueDarkMedium(),
            ).tr(),
            const SizedBox(height: AppDouble.d4),
            Text(
              LocaleKeys.home_sureCheckout,
              textAlign: TextAlign.start,
              style: TextStyles.font14Grey400Regular(),
            ).tr(),
            const SizedBox(height: AppDouble.d16),
            SizedBox(
              width: AppDouble.d1.sw,
              child: ElevatedButton(
                  onPressed: confirmOnTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.red600,
                    textStyle: TextStyles.font16WhiteMedium(),
                  ),
                  child: const Text(LocaleKeys.home_confirm).tr()),
            ),
            const SizedBox(height: AppDouble.d12),
            SizedBox(
              width: AppDouble.d1.sw,
              child: OutlinedButton(
                onPressed: () {
                  context.pop();
                },
                child: Text(
                  LocaleKeys.home_close,
                  style: TextStyles.font16Grey600Medium(),
                ).tr(),
              ),
            ),
          ],
        ),
      ));
}
