import 'package:parki_dog/features/friends/export/friends_export.dart';

Future<dynamic> showFriendOptionsBottomSheet(
  BuildContext context, {
  required String text,
  VoidCallback? blockOnTap,
  VoidCallback? deleteOnTap,
}) {
  return buildAppBottomSheet(context,
      heightFactor: AppDouble.d0_35,
      radius: AppDouble.d16,
      content: ListView(
        padding: const EdgeInsets.all(AppDouble.d16),
        children: [
          Text(
            LocaleKeys.friends_options,
            style: TextStyles.font18NavyBlueDarkSemiBold(),
          ).tr(),
          const SizedBox(height: AppDouble.d24),
          DialogButton(
            isTextArguments: true,
            text: LocaleKeys.friends_blockSomeone.tr(args: [text]),
            assetName: ImageAssets.block,
            onTap: blockOnTap,
          ),
          const SizedBox(height: AppDouble.d16),
          DialogButton(
            text: LocaleKeys.friends_deleteSomeone.tr(args: [text]),
            isTextArguments: true,
            color: ColorsManager.red600,
            assetName: ImageAssets.delete,
            onTap: deleteOnTap,
          ),
        ],
      ));
}
