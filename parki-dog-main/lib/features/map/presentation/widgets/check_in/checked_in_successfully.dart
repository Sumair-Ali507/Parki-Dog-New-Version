import 'package:parki_dog/features/map/export/map_export.dart';

Future<dynamic> checkedInSuccessfullyDialog(BuildContext context) {
  return showAppDialog(context,
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
                backgroundColor: ColorsManager.green50,
                radius: AppDouble.d28,
                child: SvgIcon(
                    color: ColorsManager.green600,
                    assetName: ImageAssets.checkOutlined)),
            const SizedBox(height: AppDouble.d24),
            Text(
              LocaleKeys.checkIn_checkedInSuccessfully,
              style: TextStyles.font20Grey700Medium(),
            ).tr(),
            // SizedBox(height: AppDouble.d12),
          ],
        ),
      ));
}
