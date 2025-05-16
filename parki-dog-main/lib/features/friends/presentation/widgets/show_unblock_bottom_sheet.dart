import 'package:parki_dog/features/friends/export/friends_export.dart';

Future<dynamic> showUnBlockBottomSheet(
  BuildContext context, {
  required String text,
  VoidCallback? onTap,
}) {
  return buildAppBottomSheet(context,
      heightFactor: AppDouble.d0_25,
      radius: AppDouble.d16,
      content: ListView(
        padding: const EdgeInsets.all(AppDouble.d16),
        children: [
          Text(
            LocaleKeys.friends_unblock,
            style: TextStyles.font18NavyBlueDarkSemiBold(),
          ).tr(),
          const SizedBox(height: AppDouble.d24),
          DialogButton(
            isTextArguments: true,
            text: LocaleKeys.friends_blockSomeone.tr(args: [text]),
            assetName: ImageAssets.block,
            onTap: onTap,
          ),
        ],
      ));
}
