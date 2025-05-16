import 'package:parki_dog/features/chat/data/models/chat_data.dart';
import 'package:parki_dog/features/chat/export/chat_export.dart';

Future<dynamic> newMessageBottomSheet(BuildContext context,
    {List<ChatData>? chats, required ChatBloc chatBloc}) {
  return buildAppBottomSheet(context,
      heightFactor: AppDouble.d0_8,
      radius: AppDouble.d16,
      content: ListView(
        children: [
          const NewMessageRow(),
          const NewMessageDivider(
            height: AppDouble.d32,
          ),
          const ToColon(),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: AppDouble.d12),
              itemBuilder: (context, index) => MembersRow(
                    dogImage: ImageAssets.dog1,
                    memberImage: ImageAssets.owner,
                    name: chats?[index].chatName ?? '',
                    isOnline: true,
                    onTap: () {
                      context.pushNamed(Routes.chatRoomRoute, arguments: {
                        'chatData': chats?[index],
                        'chatBloc': chatBloc
                      });
                    },
                  ),
              separatorBuilder: (context, index) => const NewMessageDivider(),
              itemCount: chats?.length ?? 0)
        ],
      ));
}

class MembersRow extends StatelessWidget {
  final String name;
  final String memberImage;
  final String dogImage;
  final bool isOnline;
  final VoidCallback? onTap;

  const MembersRow({
    super.key,
    required this.name,
    required this.memberImage,
    required this.dogImage,
    required this.isOnline,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
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
                    radius: AppDouble.d20,
                    backgroundImage: AssetImage(memberImage),
                  ),
                ),
                PositionedDirectional(
                  start: AppDouble.d22,
                  top: AppDouble.d6,
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
                ),
                if (isOnline)
                  PositionedDirectional(
                    start: AppDouble.d45,
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
          const SizedBox(
            width: AppDouble.d16,
          ),
          Flexible(
              child: Text(name,
                  style: TextStyles.font16Grey600Regular(),
                  maxLines: AppInt.i1,
                  overflow: TextOverflow.ellipsis))
        ],
      ),
    );
  }
}

class ToColon extends StatelessWidget {
  const ToColon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          start: AppDouble.d12, bottom: AppDouble.d16),
      child: Text(
        LocaleKeys.chat_toColon,
        style: TextStyles.font14Grey500Medium(),
      ).tr(),
    );
  }
}

class NewMessageDivider extends StatelessWidget {
  final double height;

  const NewMessageDivider({
    super.key,
    this.height = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
        thickness: AppDouble.d1, height: height, color: ColorsManager.grey100);
  }
}

class NewMessageRow extends StatelessWidget {
  const NewMessageRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDouble.d16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(LocaleKeys.chat_newMessage,
                  style: TextStyles.font18Grey700SemiBold())
              .tr(),
          IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const SvgIcon(
                  color: ColorsManager.grey700, assetName: ImageAssets.close))
        ],
      ),
    );
  }
}
