import 'package:parki_dog/features/chat/export/chat_export.dart';

class InboxChatHead extends StatelessWidget {
  final String personImage;
  final String dogImage;
  final String name;
  final bool isOnline;
  final VoidCallback? onTap;

  const InboxChatHead({
    super.key,
    required this.personImage,
    required this.dogImage,
    required this.name,
    this.isOnline = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                        radius: AppDouble.d6, // adjust size for the indicator
                        backgroundColor: ColorsManager.green800,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: AppDouble.d8),
          SizedBox(
            width: AppDouble.d78,
            child: Text(
              name,
              maxLines: AppInt.i1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyles.font12Grey500Medium(),
            ),
          ),
        ],
      ),
    );
  }
}
