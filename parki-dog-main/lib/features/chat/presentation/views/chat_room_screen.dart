import 'package:parki_dog/app/app_export.dart';
import 'package:parki_dog/features/chat/data/models/chat_data.dart';
import 'package:parki_dog/features/chat/export/chat_export.dart';
import 'package:parki_dog/features/chat/services/chat_services.dart';

class ChatRoomScreen extends StatefulWidget {
  final ChatData chatData;
  final ChatBloc chatBloc;

  const ChatRoomScreen(
      {super.key, required this.chatData, required this.chatBloc});

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final TextEditingController sendFieldController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // Create an instance of your SocketService.
  final SocketService _socketService = SocketService();

  // (Optional) Local state for typing indicator
  bool isTyping = false;
  String? receiverId;

  @override
  void initState() {
    getReceiverId();
    super.initState();
    _initializeSocket();
  }

  Future<void> getReceiverId() async {
    receiverId = await getIt.get<AppPreferences>().getCurrentUser;
  }

  Future<void> _initializeSocket() async {
    // Retrieve token (adjust this code to match your token retrieval)
    String token =
        await getIt.get<AppPreferences>().getSecuredString(userToken);

    // Connect to socket and pass in callbacks for socket events.
    _socketService.connect(
      token: token,
      chatId: widget.chatData.sId ?? '',
      onNewMessage: _handleNewMessage,
      onTyping: _handleTyping,
      onStopTyping: _handleStopTyping,
    );
  }

  /// Callback when a new message is received from the socket.
  void _handleNewMessage(Map<String, dynamic> messageData) {
    // Here you can create a new ChatData/message model instance from messageData.
    // For example, if your BLoC has a NewMessageReceivedEvent, you can add it:
    widget.chatBloc.add(NewMessageReceivedEvent(messageData: messageData));
    // Optionally scroll to bottom
    _scrollToBottom();
  }

  /// Callback when a typing event is received.
  void _handleTyping(Map<String, dynamic> data) {
    // Update your UI to show that someone is typing.
    setState(() {
      isTyping = true;
    });
  }

  /// Callback when stopTyping is received.
  void _handleStopTyping(Map<String, dynamic> data) {
    // Update your UI to remove the typing indicator.
    setState(() {
      isTyping = false;
    });
  }

  @override
  void dispose() {
    sendFieldController.dispose();
    _scrollController.dispose();
    _socketService.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

// Example of sending a typing event when the user types:
  void _onMessageFieldChanged(String value) {
    if (widget.chatData.sId != null) {
      // Replace the user map with your current user's details.
      _socketService.emitTyping(
        chatId: widget.chatData.sId!,
        user: {
          'id': receiverId,
          // Replace with actual user id
          'firstName': widget.chatData.participants?.first.firstName,
          // Replace with actual first name
          'lastName': widget.chatData.participants?.first.lastName,
          // Replace with actual last name
        },
      );
      // Optionally, you can set up a debounce to emit stopTyping after a delay.
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      // value: getIt<ChatBloc>()
      value: widget.chatBloc
        ..add(GetMessagesEvent(chatId: widget.chatData.sId ?? '')),
      child: BlocConsumer<ChatBloc, ChatState>(
        bloc: widget.chatBloc,
        listener: (chatContext, chatState) {
          if (chatState.isGetMessagesError) {
            showAppSnackBar(context, content: chatState.getMessagesError);
            context.pop();
          }
          if (chatState.isSendMessageError) {
            showAppSnackBar(context, content: chatState.sendMessageError);
          }
          if (chatState.isGetMessagesSuccess) {
            _scrollToBottom(); // Scroll to latest messages after fetching
          }
          if (chatState.isSendMessageSuccess) {
            _scrollToBottom(); // Scroll to latest after sending a message
          }
        },
        builder: (chatContext, chatState) {
          return Scaffold(
            appBar: AppBar(
              leading: const BackAppBar(),
              centerTitle: false,
              title: ChatRoomAppBarRow(
                userImage: ImageAssets.owner,
                userName: widget.chatData.chatName ?? '',
                isOnline: false,
                isTyping: isTyping,
                // isTyping: false,
                dogImage: ImageAssets.dog1,
                lastSeenDate: widget.chatData.lastMessage?.updatedAt
                        ?.formattedDateForInboxItem ??
                    '',
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      chatOptionsBottomSheet(context,
                          text: widget.chatData.chatName ?? '', blockOnTap: () {
                        context.pop();
                        blockingDialog(context,
                            name: widget.chatData.chatName ?? '',
                            isBlocked: false,
                            isBlocking: false,
                            mainActionOnTap: () {});
                      }, deleteOnTap: () {
                        context.pop();
                        chatDeletingDialog(context,
                            name: widget.chatData.chatName ?? '',
                            chatBloc: chatContext.read<ChatBloc>(),
                            chatId: widget.chatData.sId ?? '');
                      });
                    },
                    icon: const SvgIcon(
                        color: ColorsManager.grey700,
                        assetName: ImageAssets.more))
              ],
              elevation: AppDouble.d1,
              shadowColor: ColorsManager.grey100,
              surfaceTintColor: Colors.white,
            ),
            body: chatState.isGetMessagesSuccess
                ? Column(children: [
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: AppDouble.d8, vertical: AppDouble.d4),
                    //   margin:
                    //       const EdgeInsetsDirectional.only(top: AppDouble.d20),
                    //   decoration: BoxDecoration(
                    //     color: ColorsManager.grey200,
                    //     borderRadius: BorderRadius.circular(AppDouble.d8),
                    //   ),
                    //   child: Text(
                    //     LocaleKeys.chat_today,
                    //     style: TextStyles.font10Grey700Medium(),
                    //   ).tr(),
                    // ),
                    Expanded(
                        child: ListView(
                      controller: _scrollController,
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppDouble.d16),
                      children: chatState.messagesResponse!.getChatData!
                          .map(
                            (e) => MessageBubble(
                              message: e.content ?? '',
                              isSentByMe:
                                  //check if the message is sent by the current user
                                  e.sender?.id == receiverId,
                              // e.sender?.id,
                              time:
                                  e.createdAt?.formattedDateForInboxItem ?? '',
                            ),
                          )
                          .toList(),
                    )),
                    SendTextField(
                      controller: sendFieldController,
                      onChanged: _onMessageFieldChanged,
                      sendOnTap: () {
                        if (widget.chatData.sId != null) {
                          widget.chatBloc.add(SendMessagesEvent(
                            chatId: widget.chatData.sId!,
                            content: sendFieldController.text,
                          ));
                          sendFieldController.clear();
                          // Optionally emit a stopTyping event if necessary:
                          _socketService.emitStopTyping(
                            chatId: widget.chatData.sId!,
                            userId:
                                'currentUserId', // Replace with actual user id
                          );
                        }
                        // widget.chatBloc.add(SendMessagesEvent(
                        //     chatId: widget.chatData.sId ?? '',
                        //     content: sendFieldController.text));
                        // sendFieldController.clear();
                      },
                    ),
                  ])
                : const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
