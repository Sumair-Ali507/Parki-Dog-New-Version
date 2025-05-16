import 'package:parki_dog/features/home/export/home_export.dart';

class HomeAppBar extends StatelessWidget {
  final VoidCallback? chatOnTap;
  final VoidCallback? notificationOnTap;
  final bool isRedCircleChat;
  final bool isRedCircleNotification;

  const HomeAppBar({
    super.key,
    this.chatOnTap,
    this.notificationOnTap,
    this.isRedCircleChat = false,
    this.isRedCircleNotification = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(child: SvgPicture.asset(ImageAssets.parkiDogAppBar)),
        Row(
          children: [
            HomeAppBarIcon(
              onTap: chatOnTap,
              svgAssetName: ImageAssets.chatBubbles,
              isRedCircle: isRedCircleChat,
            ),
            const SizedBox(width: AppDouble.d8),
            HomeAppBarIcon(
              onTap: notificationOnTap,
              svgAssetName: ImageAssets.notification,
              isRedCircle: isRedCircleNotification,
            ),
          ],
        )
      ],
    );
  }
}
