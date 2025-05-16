import 'package:parki_dog/features/home/export/home_export.dart';

class NearbyPlacesHeader extends StatelessWidget {
  final VoidCallback? mapOnTap;

  const NearbyPlacesHeader({super.key, this.mapOnTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDouble.d16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LocaleKeys.home_nearbyPlaces,
            style: TextStyles.font18Grey700SemiBold(),
          ).tr(),
          InkWell(
            onTap: mapOnTap,
            child: Row(
              children: [
                Text(LocaleKeys.home_map,
                        style: TextStyles.font12PrimaryMedium())
                    .tr(),
                const SizedBox(width: AppDouble.d4),
                const SvgIcon(
                    color: ColorsManager.primaryColor,
                    assetName: ImageAssets.forward)
              ],
            ),
          )
        ],
      ),
    );
  }
}
