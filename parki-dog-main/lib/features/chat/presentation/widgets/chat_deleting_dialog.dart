import 'package:parki_dog/features/chat/export/chat_export.dart';

Future<dynamic> chatDeletingDialog(BuildContext context,
    {required ChatBloc chatBloc,
    required String chatId,
    required String name}) {
  return showAppDialog(context,
      title: DeleteDialogTitle(
        chatBloc: chatBloc,
      ),
      content: SizedBox(
        width: AppDouble.d1.sw,
        child: BlocBuilder<ChatBloc, ChatState>(
            bloc: chatBloc,
            builder: (chatContext, chatState) {
              return chatState.isDeleteChatLoading ||
                      chatState.isDeleteChatSuccess
                  ? DialogStatus(
                      isDone: chatState.isDeleteChatSuccess,
                      text: LocaleKeys.friends_deleted,
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.friends_deleteSomeone.tr(args: [name]),
                          textAlign: TextAlign.start,
                          style: TextStyles.font18NavyBlueDarkMedium(),
                        ),
                        const SizedBox(height: AppDouble.d4),
                        Text(
                          LocaleKeys.friends_wantToDelete.tr(args: [name]),
                          textAlign: TextAlign.start,
                          style: TextStyles.font14Grey400Regular(),
                        ),
                        const SizedBox(height: AppDouble.d16),
                        SizedBox(
                          width: AppDouble.d1.sw,
                          child: ElevatedButton(
                              onPressed: () {
                                chatBloc.add(DeleteChatEvent(chatId: chatId));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsManager.red600,
                                textStyle: TextStyles.font16WhiteMedium(),
                              ),
                              child:
                                  const Text(LocaleKeys.friends_delete).tr()),
                        ),
                        const SizedBox(height: AppDouble.d12),
                        SizedBox(
                          width: AppDouble.d1.sw,
                          child: OutlinedButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: Text(
                              LocaleKeys.friends_cancel,
                              style: TextStyles.font16Grey600Medium(),
                            ).tr(),
                          ),
                        ),
                      ],
                    );
            }),
      ));
}

class DeleteDialogTitle extends StatelessWidget {
  final ChatBloc chatBloc;

  const DeleteDialogTitle({super.key, required this.chatBloc});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ChatBloc, ChatState, bool>(
      bloc: chatBloc,
      selector: (state) =>
          state.isDeleteChatLoading || state.isDeleteChatSuccess,
      builder: (deleteContext, isDeleteChatActive) {
        return isDeleteChatActive
            ? const SizedBox()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ColorsManager.borderLightRed,
                        width: AppDouble.d8,
                      ),
                    ),
                    child: const CircleAvatar(
                      backgroundColor: ColorsManager.red100,
                      child: SvgIcon(
                        color: ColorsManager.redIcon,
                        assetName: ImageAssets.cancel,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const AppIcon(
                      assetName: ImageAssets.close,
                      color: ColorsManager.iconDefault,
                    ),
                  ),
                ],
              );
      },
    );
  }
}
