import 'package:parki_dog/features/chat/export/chat_export.dart';

class ChatRoomAppBarRow extends StatelessWidget {
  final String userImage;
  final String dogImage;
  final String userName;
  final bool isOnline;
  final bool isTyping;
  final String lastSeenDate;

  const ChatRoomAppBarRow({
    super.key,
    required this.userImage,
    required this.dogImage,
    required this.userName,
    required this.isOnline,
    required this.isTyping,
    required this.lastSeenDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: AppDouble.d40,
          width: AppDouble.d60,
          child: Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              PositionedDirectional(
                start: AppDouble.d0,
                child: CircleAvatar(
                  radius: AppDouble.d16,
                  backgroundImage: AssetImage(userImage),
                ),
              ),
              PositionedDirectional(
                start: AppDouble.d20,
                top: AppDouble.d10,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: AppDouble.d1,
                      )),
                  child: CircleAvatar(
                    radius: AppDouble.d12,
                    backgroundImage: AssetImage(dogImage),
                  ),
                ),
              ),
              PositionedDirectional(
                start: AppDouble.d38,
                bottom: AppDouble.d5,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: AppDouble.d1_5,
                      )),
                  child: CircleAvatar(
                    radius: AppDouble.d5,
                    backgroundColor: isOnline
                        ? ColorsManager.green800
                        : ColorsManager.red600,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: AppDouble.d4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: AppDouble.d1.sw - AppDouble.d205,
                child: Text(
                  userName,
                  style: TextStyles.font14Grey600SemiBold(),
                  maxLines: AppInt.i1,
                  overflow: TextOverflow.ellipsis,
                )),
            if (isTyping)
              SizedBox(
                width: AppDouble.d1.sw - AppDouble.d205,
                child: Text(
                  LocaleKeys.chat_typing,
                  style: TextStyles.font12Grey400Regular(),
                  maxLines: AppInt.i1,
                  overflow: TextOverflow.ellipsis,
                ).tr(),
              ),
            if (!isTyping)
              SizedBox(
                width: AppDouble.d1.sw - AppDouble.d205,
                child: Text(
                  LocaleKeys.chat_lastSeen.tr(args: [lastSeenDate]),
                  style: TextStyles.font12Grey400Regular(),
                  maxLines: AppInt.i1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
