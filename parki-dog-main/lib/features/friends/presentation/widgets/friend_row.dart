import 'package:parki_dog/features/friends/export/friends_export.dart';

class FriendRow extends StatelessWidget {
  final String friendImage;
  final String friendName;
  final String dogImage;
  final String dogName;
  final bool isMale;
  final VoidCallback? moreOnTap;

  const FriendRow({
    super.key,
    required this.friendImage,
    required this.friendName,
    required this.dogImage,
    required this.dogName,
    required this.isMale,
    this.moreOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDouble.d16),
          child: Row(
            children: [
              OverlappingImagesOwnerDogsWidget(
                dogImage: dogImage,
                friendImage: friendImage,
              ),
              const SizedBox(
                width: AppDouble.d8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(friendName, style: TextStyles.font16Grey600Medium()),
                  const SizedBox(height: AppDouble.d4),
                  Row(
                    children: [
                      Text(LocaleKeys.friends_dogColon.tr(args: [dogName]),
                          style: TextStyles.font12Grey400Regular()),
                      const SizedBox(width: AppDouble.d4),
                      SvgIcon(
                          color: ColorsManager.secondaryColor,
                          assetName:
                              isMale ? ImageAssets.man : ImageAssets.woman)
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        IconButton(
            onPressed: moreOnTap,
            icon: const SvgIcon(
                color: ColorsManager.grey700,
                assetName: ImageAssets.moreOutlined))
      ],
    );
  }
}
