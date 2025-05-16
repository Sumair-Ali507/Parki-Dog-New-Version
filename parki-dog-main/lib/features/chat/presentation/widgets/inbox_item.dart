import 'package:parki_dog/features/chat/export/chat_export.dart';

class InboxItem extends StatelessWidget {
  final String personImage;
  final String dogImage;
  final String name;
  final String lastMessage;
  final String time;
  final bool isOnline;
  final int messageCount;
  final VoidCallback? onTap;

  const InboxItem({
    super.key,
    required this.personImage,
    required this.dogImage,
    required this.name,
    required this.lastMessage,
    required this.time,
    this.isOnline = true,
    required this.messageCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                    radius: AppDouble.d28,
                    backgroundImage: AssetImage(personImage),
                  ),
                ),
                PositionedDirectional(
                  start: AppDouble.d34,
                  top: AppDouble.d12,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: AppDouble.d2,
                        )),
                    child: CircleAvatar(
                      radius: AppDouble.d20,
                      backgroundImage: AssetImage(dogImage),
                    ),
                  ),
                ),
                if (isOnline)
                  PositionedDirectional(
                    start: AppDouble.d63,
                    bottom: AppDouble.d0,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: AppDouble.d1_5,
                          )),
                      child: const CircleAvatar(
                        radius: AppDouble.d6,
                        backgroundColor: ColorsManager.green800,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: AppDouble.d16),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(name,
                            maxLines: AppInt.i1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.font16Grey600Medium()),
                      ),
                      Text(time, style: TextStyles.font10Grey300RegularRoboto())
                    ]),
                const SizedBox(height: AppDouble.d4),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(lastMessage,
                            maxLines: AppInt.i1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.font14Grey400Regular()),
                      ),
                      if (messageCount > 0)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppDouble.d8, vertical: AppDouble.d2),
                          decoration: const ShapeDecoration(
                              color: ColorsManager.primary200,
                              shape: StadiumBorder()),
                          child: Text(
                            '$messageCount',
                            style: TextStyles.font9Primary600Medium(),
                          ),
                        )
                    ])
              ],
            ),
          )
        ],
      ),
    );
  }
}
