import 'package:parki_dog/features/map/export/map_export.dart';

class LocationRow extends StatelessWidget {
  final String location;
  final VoidCallback? onNavigate;
  const LocationRow({
    super.key,
    required this.location,
    this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const SvgIcon(
              color: ColorsManager.navyBlue,
              assetName: ImageAssets.locationPin,
              height: AppDouble.d24,
            ),
            const SizedBox(width: AppDouble.d8),
            Container(
                constraints: BoxConstraints(maxWidth: AppDouble.d0_6.sw),
                child: Text(
                  location,
                  style: TextStyles.font14Grey700Regular(),
                  maxLines: AppInt.i1,
                  overflow: TextOverflow.ellipsis,
                ))
          ],
        ),
        OutlinedButton.icon(
          onPressed: onNavigate,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
                color: ColorsManager.secondaryColor, width: AppDouble.d1),
          ),
          label: Text(
            LocaleKeys.checkIn_go,
            style: TextStyles.font14Secondary600Regular(),
          ).tr(),
          icon: const SvgIcon(
              color: ColorsManager.secondary600,
              assetName: ImageAssets.navigate),
        )
      ],
    );
  }
}
