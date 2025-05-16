import 'package:parki_dog/features/menu/export/menu_export.dart';

class MenuProfileContainer extends StatelessWidget {
  final String name;
  final String dogName;
  final bool isMale;
  final String dogImage;
  final String ownerImage;
  final VoidCallback? onTap;

  const MenuProfileContainer({
    super.key,
    required this.name,
    required this.dogName,
    required this.isMale,
    required this.dogImage,
    required this.ownerImage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDouble.d16),
      child: MenuContainer(
          child: Row(
        children: [
          SizedBox(
            height: AppDouble.d56,
            width: AppDouble.d78,
            child: Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                PositionedDirectional(
                  start: AppDouble.d0,
                  child: CircleAvatar(
                    radius: AppDouble.d24,
                    backgroundImage: AssetImage(ownerImage),
                  ),
                ),
                PositionedDirectional(
                  start: AppDouble.d28,
                  top: AppDouble.d12,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: AppDouble.d2,
                        )),
                    child: CircleAvatar(
                      radius: AppDouble.d16,
                      backgroundImage: AssetImage(dogImage),
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyles.font14Grey600SemiBold()),
              SizedBox(
                width: AppDouble.d1.sw - AppDouble.d142,
                child: Row(
                  children: [
                    Flexible(
                      child: Text(LocaleKeys.menu_dogColon.tr(args: [dogName]),
                          maxLines: AppInt.i1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.font14Grey400Regular()),
                    ),
                    const SizedBox(width: AppDouble.d4),
                    SvgIcon(
                        color: ColorsManager.secondaryColor,
                        assetName:
                            isMale ? ImageAssets.man : ImageAssets.woman),
                  ],
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
