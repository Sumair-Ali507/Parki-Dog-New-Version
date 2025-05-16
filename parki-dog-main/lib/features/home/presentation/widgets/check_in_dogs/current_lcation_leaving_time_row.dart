import 'package:parki_dog/features/home/export/home_export.dart';

class CurrentLocationLeavingTimeRow extends StatelessWidget {
  final String currentLocation;
  final String leavingTime;

  const CurrentLocationLeavingTimeRow({
    super.key,
    required this.currentLocation,
    required this.leavingTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          start: AppDouble.d16, end: AppDouble.d16, top: AppDouble.d16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SvgIcon(
                    assetName: ImageAssets.locationPin,
                    color: ColorsManager.primaryColor),
                const SizedBox(width: AppDouble.d8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(LocaleKeys.home_currentLocation,
                            maxLines: AppInt.i1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.font14BlackRegular())
                        .tr(),
                    const SizedBox(height: AppDouble.d3),
                    Text(currentLocation, style: TextStyles.font14BlackMedium())
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SvgIcon(
                    assetName: ImageAssets.clock,
                    color: ColorsManager.primaryColor),
                const SizedBox(width: AppDouble.d8),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        LocaleKeys.home_leavingTime.tr(),
                        style: TextStyles.font14BlackRegular(),
                        maxLines: 1,
                        stepGranularity: 0.1,
                      ),
                      const SizedBox(height: AppDouble.d3),
                      Text(leavingTime, style: TextStyles.font14BlackMedium())
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
