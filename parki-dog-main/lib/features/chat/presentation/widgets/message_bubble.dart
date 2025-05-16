import 'package:parki_dog/features/chat/export/chat_export.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isSentByMe;
  final String time;

  const MessageBubble(
      {super.key,
      required this.message,
      required this.isSentByMe,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: AppDouble.d8, horizontal: AppDouble.d12),
        margin: EdgeInsetsDirectional.only(
            start: isSentByMe ? AppDouble.d0_2.sw : AppDouble.d0,
            top: AppDouble.d16,
            bottom: AppDouble.d16,
            end: isSentByMe ? AppDouble.d0 : AppDouble.d0_2.sw),
        decoration: BoxDecoration(
          color:
              isSentByMe ? ColorsManager.primaryColor : ColorsManager.grey100,
          borderRadius: BorderRadiusDirectional.only(
            topStart: const Radius.circular(AppDouble.d16),
            topEnd: const Radius.circular(AppDouble.d16),
            bottomStart:
                Radius.circular(isSentByMe ? AppDouble.d16 : AppDouble.d0),
            bottomEnd:
                Radius.circular(isSentByMe ? AppDouble.d0 : AppDouble.d15),
          ),
        ),
        child: Column(
          crossAxisAlignment:
              isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                message,
                style: TextStyles.font14Grey700RegularRoboto(
                    color: isSentByMe
                        ? ColorsManager.white
                        : ColorsManager.grey700),
              ),
            ),
            // const SizedBox(height: 5),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Text(
                time,
                style: TextStyles.font9Grey400RegularRoboto(
                    color: isSentByMe
                        ? ColorsManager.grey100
                        : ColorsManager.grey400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
