import 'package:parki_dog/features/map/export/map_export.dart';

class CheckedInItem extends StatelessWidget {
  final String ownerName;
  final String dogName;
  final String ownerImage;
  final String dogImage;
  final bool isSafe;
  final bool isDogMale;
  final VoidCallback? moreOnTap;

  const CheckedInItem({
    super.key,
    required this.ownerName,
    required this.dogName,
    required this.ownerImage,
    required this.dogImage,
    required this.isSafe,
    required this.isDogMale,
    this.moreOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              height: AppDouble.d40,
              width: AppDouble.d56,
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  PositionedDirectional(
                    start: AppDouble.d0,
                    child: CircleAvatar(
                      radius: AppDouble.d20,
                      backgroundImage: AssetImage(ownerImage),
                    ),
                  ),
                  PositionedDirectional(
                    start: AppDouble.d26,
                    top: AppDouble.d9,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: AppDouble.d2,
                          )),
                      child: CircleAvatar(
                        radius: AppDouble.d14,
                        backgroundImage: AssetImage(dogImage),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: AppDouble.d8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: AppDouble.d0_35.sw),
                      child: Text(
                        ownerName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: AppInt.i1,
                        style: TextStyles.font16Grey600Regular(),
                      ),
                    ),
                    const SizedBox(width: AppDouble.d4),
                    isSafe
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: AppDouble.d4,
                                horizontal: AppDouble.d8),
                            decoration: BoxDecoration(
                              color: ColorsManager.green100,
                              borderRadius: BorderRadius.circular(AppDouble.d8),
                            ),
                            child: Text(
                              LocaleKeys.checkIn_safe,
                              style: TextStyles.font12Green800Medium(),
                            ).tr(),
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: AppDouble.d4,
                                horizontal: AppDouble.d8),
                            decoration: BoxDecoration(
                              color: ColorsManager.red100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              LocaleKeys.checkIn_unsafe,
                              style: TextStyles.font12Green800Medium(
                                  color: ColorsManager.red600),
                            ).tr(),
                          )
                  ],
                ),
                const SizedBox(height: AppDouble.d3),
                Row(
                  children: [
                    SvgIcon(
                        color: ColorsManager.secondaryColor,
                        assetName:
                            isDogMale ? ImageAssets.man : ImageAssets.woman),
                    const SizedBox(width: AppDouble.d4),
                    Container(
                      constraints: BoxConstraints(maxWidth: AppDouble.d0_5.sw),
                      child: Text(
                        dogName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: AppInt.i1,
                        style: TextStyles.font12Grey400Regular(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: const SvgIcon(
                color: ColorsManager.grey700,
                assetName: ImageAssets.moreOutlined))
      ],
    );
  }
}
