import 'package:parki_dog/features/friends/export/friends_export.dart';

Future<dynamic> showBlocklistBottomSheet(BuildContext context) {
  return buildAppBottomSheet(context,
      heightFactor: AppDouble.d0_2,
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
            text: LocaleKeys.friends_blocklist,
            assetName: ImageAssets.block,
            onTap: () {
              context.pushNamed(Routes.blockListRoute);
            },
          ),
        ],
      ));
}
