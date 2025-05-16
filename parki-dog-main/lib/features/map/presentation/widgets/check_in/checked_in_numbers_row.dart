import 'package:parki_dog/features/map/export/map_export.dart';

class CheckInNumbersRow extends StatelessWidget {
  final int count;
  const CheckInNumbersRow({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const SvgIcon(
              color: ColorsManager.grey700,
              assetName: ImageAssets.petOutlined,
              height: AppDouble.d24,
            ),
            const SizedBox(width: AppDouble.d8),
            Text(
              LocaleKeys.checkIn_checkedIn,
              style: TextStyles.font16Grey700Medium(),
            ).tr()
          ],
        ),
        Text(
          '$count',
          style: TextStyles.font14Grey700Medium(),
        )
      ],
    );
  }
}
