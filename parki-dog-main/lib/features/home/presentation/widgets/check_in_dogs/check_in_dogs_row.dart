import 'package:parki_dog/features/home/export/home_export.dart';

class CheckInDogsRow extends StatelessWidget {
  final int dogCount;
  final VoidCallback? signalDogsOnTap;

  const CheckInDogsRow({
    super.key,
    required this.dogCount,
    this.signalDogsOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDouble.d16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SvgIcon(
                    assetName: ImageAssets.animalLeg,
                    color: ColorsManager.primaryColor),
                const SizedBox(width: AppDouble.d8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(LocaleKeys.home_checkedInDogs,
                            style: TextStyles.font14BlackRegular())
                        .tr(),
                    const SizedBox(height: AppDouble.d3),
                    Row(
                      children: [
                        const DogsStack(),
                        Text(LocaleKeys.home_otherDogs,
                                style: TextStyles.font12BlackLight(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis)
                            .plural(dogCount,
                                format: NumberFormat.compact(
                                    locale: context.locale.toString()))
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.red100,
                shape: const StadiumBorder(),
              ),
              onPressed: signalDogsOnTap,
              label: Text(
                LocaleKeys.home_signalDogs,
                style: TextStyles.font14RedIconRegular(),
              ).tr(),
              icon: const SvgIcon(
                  color: ColorsManager.redIcon,
                  assetName: ImageAssets.disclaimer))
        ],
      ),
    );
  }
}
