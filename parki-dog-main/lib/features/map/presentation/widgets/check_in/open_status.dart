import 'package:parki_dog/features/map/export/map_export.dart';

class OpenStatus extends StatelessWidget {
  final String duration;
  final bool isOpenNow;
  const OpenStatus({
    super.key,
    required this.duration,
    required this.isOpenNow,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SvgIcon(
          color: ColorsManager.navyBlue,
          assetName: ImageAssets.clock,
          height: AppDouble.d24,
        ),
        const SizedBox(width: AppDouble.d8),
        RichText(
            text: TextSpan(
          text: '$duration - ',
          style: TextStyles.font14Grey700Regular(),
          children: [
            TextSpan(
              text: isOpenNow
                  ? LocaleKeys.checkIn_openNow.tr()
                  : LocaleKeys.checkIn_closed.tr(),
              style: TextStyles.font14Grey700Regular(
                  color:
                      isOpenNow ? ColorsManager.green : ColorsManager.redDark),
            ),
          ],
        )),
      ],
    );
  }
}
