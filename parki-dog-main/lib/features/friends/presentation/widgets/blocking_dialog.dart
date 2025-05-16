import 'package:parki_dog/features/friends/export/friends_export.dart';

Future<dynamic> blockingDialog(
  BuildContext context, {
  VoidCallback? mainActionOnTap,
  required String name,
  bool isBlocking = false,
  bool isBlocked = false,
}) {
  return showAppDialog(
    context,
    title: (isBlocking == true || isBlocked == true)
        ? null
        : Row(
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
    content: isBlocking || isBlocked
        ? SizedBox(
            width: AppDouble.d1.sw,
            child: DialogStatus(
              isDone: isBlocked,
              text: LocaleKeys.friends_blocked,
            ))
        : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.friends_blockingSomeone.tr(args: [name]),
                textAlign: TextAlign.start,
                style: TextStyles.font18NavyBlueDarkMedium(),
              ),
              const SizedBox(height: AppDouble.d4),
              Text(
                LocaleKeys.friends_wantToBlock.tr(args: [name]),
                textAlign: TextAlign.start,
                style: TextStyles.font14Grey400Regular(),
              ),
              const SizedBox(height: AppDouble.d16),
              SizedBox(
                width: AppDouble.d1.sw,
                child: ElevatedButton(
                    onPressed: mainActionOnTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.red600,
                      textStyle: TextStyles.font16WhiteMedium(),
                    ),
                    child: const Text(LocaleKeys.friends_block).tr()),
              ),
              const SizedBox(height: AppDouble.d12),
              SizedBox(
                width: AppDouble.d1.sw,
                child: OutlinedButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    LocaleKeys.friends_cancel,
                    style: TextStyles.font16Grey600Medium(),
                  ).tr(),
                ),
              ),
            ],
          ),
  );
}
