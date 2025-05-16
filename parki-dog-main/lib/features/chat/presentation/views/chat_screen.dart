import 'package:parki_dog/core/services/service_locator.dart';
import 'package:parki_dog/features/chat/export/chat_export.dart';
import 'package:parki_dog/features/chat/presentation/widgets/empty_inbox.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChatBloc>()..add(GetChatsEvent()),
      child: BlocConsumer<ChatBloc, ChatState>(
        listener: (chatContext, chatState) {
          if (chatState.isAllChatsError) {
            showAppSnackBar(context, content: chatState.allChatsError);
            context.pop();
          }
        },
        builder: (chatContext, chatState) {
          return Scaffold(
            appBar: AppBar(
              leading: const BackAppBar(),
              title: const Text(LocaleKeys.chat_inbox).tr(),
              actions: [
                IconButton(
                    onPressed: chatState.isAllChatsError ||
                            chatState.isAllChatsLoading
                        ? null
                        : () {
                            newMessageBottomSheet(context,
                                chats: chatState.allChatResponse?.getChatData,
                                chatBloc: chatContext.read<ChatBloc>());
                          },
                    icon: const SvgIcon(
                        color: ColorsManager.primaryColor,
                        assetName: ImageAssets.addFilled))
              ],
            ),
            body: chatState.isAllChatsSuccess
                ? ListView(
                    padding: const EdgeInsets.all(AppDouble.d16),
                    children: [
                      SearchField(
                        controller:
                            chatContext.read<ChatBloc>().searchFieldController,
                        onChanged: (query) {
                          chatContext
                              .read<ChatBloc>()
                              .add(SearchChatsEvent(query: query));
                        },
                      ),
                      chatState.allChatResponse?.getChatData?.isNotEmpty ??
                              false
                          ? const SizedBox(height: AppDouble.d24)
                          : const SizedBox(),
                      chatState.allChatResponse?.getChatData?.isNotEmpty ??
                              false
                          ? SizedBox(
                              height: AppDouble.d83,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      InboxChatHead(
                                        personImage: ImageAssets.owner,
                                        dogImage: ImageAssets.dog1,
                                        name: chatState
                                                .allChatResponse
                                                ?.getChatData?[index]
                                                .chatName ??
                                            '',
                                        onTap: () {
                                          context.pushNamed(
                                              Routes.chatRoomRoute,
                                              arguments: chatState.filteredChats
                                                  ?.getChatData?[index]);
                                        },
                                      ),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        width: AppDouble.d16,
                                      ),
                                  itemCount: chatState.allChatResponse
                                          ?.getChatData?.length ??
                                      0),
                            )
                          : const SizedBox(),
                      chatState.allChatResponse?.getChatData?.isNotEmpty ??
                              false
                          ? const SizedBox(height: AppDouble.d24)
                          : const SizedBox(),
                      chatState.filteredChats?.getChatData?.isNotEmpty ?? false
                          ? ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => InboxItem(
                                    personImage: ImageAssets.owner,
                                    dogImage: ImageAssets.dog1,
                                    name: chatState.filteredChats
                                            ?.getChatData?[index].chatName ??
                                        '',
                                    lastMessage: chatState
                                            .filteredChats
                                            ?.getChatData?[index]
                                            .lastMessage
                                            ?.content ??
                                        '',
                                    time: (chatState
                                                .filteredChats
                                                ?.getChatData?[index]
                                                .lastMessage
                                                ?.updatedAt ??
                                            '')
                                        .formattedDateForInboxItem,
                                    isOnline: true,
                                    messageCount: chatState.filteredChats
                                            ?.getChatData?[index].unreadCount ??
                                        0,
                                    onTap: () {
                                      context.pushNamed(Routes.chatRoomRoute,
                                          arguments: {
                                            'chatData': chatState.filteredChats
                                                ?.getChatData?[index],
                                            'chatBloc':
                                                chatContext.read<ChatBloc>()
                                          });
                                    },
                                  ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: AppDouble.d16),
                              itemCount: chatState
                                      .filteredChats?.getChatData?.length ??
                                  0)
                          : const EmptyInbox()
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        },
      ),
    );
  }
}
