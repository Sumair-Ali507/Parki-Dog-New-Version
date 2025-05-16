import 'package:parki_dog/features/map/export/map_export.dart';

class DistanceTimeNotifyMeRow extends StatelessWidget {
  final String time;
  final String distance;
  final String transportationType;
  const DistanceTimeNotifyMeRow({
    super.key,
    required this.time,
    required this.distance,
    required this.transportationType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const SvgIcon(
                color: ColorsManager.grey400,
                assetName: ImageAssets.locationPin),
            const SizedBox(width: AppDouble.d2),
            Text(distance, style: TextStyles.font12Grey400Regular()),
            const SizedBox(width: AppDouble.d16),
            const SvgIcon(
                color: ColorsManager.grey400, assetName: ImageAssets.bus),
            const SizedBox(width: AppDouble.d2),
            Text('$time by $transportationType',
                style: TextStyles.font12Grey400Regular()),
          ],
        ),
        const NotifyMeButton(),
      ],
    );
  }
}
