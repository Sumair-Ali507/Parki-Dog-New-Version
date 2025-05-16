import 'package:parki_dog/features/notifications/export/notifications_export.dart';

class NotificationItem extends StatelessWidget {
  final String notificationText;
  final String time;
  final String personImage;
  final String dogImage;
  final bool isRead;
  final VoidCallback? onTap;
  final bool isItemLoading;

  const NotificationItem({
    super.key,
    required this.notificationText,
    required this.time,
    required this.personImage,
    required this.dogImage,
    required this.isRead,
    this.onTap,
    required this.isItemLoading,
  });

  @override
  Widget build(BuildContext context) {
    return isItemLoading
        ? const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(child: CircularProgressIndicator()),
          )
        : InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(AppDouble.d16),
              color: isRead ? ColorsManager.white : ColorsManager.primary100,
              child: Row(
                children: [
                  OverlappingImagesOwnerDogsWidget(
                    friendImage: personImage,
                    dogImage: dogImage,
                  ),
                  const SizedBox(width: AppDouble.d8),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(notificationText,
                            style: TextStyles.font14Grey700Regular()),
                        const SizedBox(height: 4),
                        Text(
                          time,
                          style: TextStyles.font9Grey400Regular(),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
