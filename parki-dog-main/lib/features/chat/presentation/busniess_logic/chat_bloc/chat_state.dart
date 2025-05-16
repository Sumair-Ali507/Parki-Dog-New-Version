part of 'chat_bloc.dart';

enum AllChatsStatus {
  initial,
  loading,
  success,
  error,
}

enum GetMessagesStatus {
  initial,
  loading,
  success,
  error,
}

enum SendMessageStatus {
  initial,
  loading,
  success,
  error,
}

enum DeleteChatStatus {
  initial,
  loading,
  success,
  error,
}

extension AllChatsStatusX on ChatState {
  bool get isAllChatsInitial => allChatsStatus == AllChatsStatus.initial;

  bool get isAllChatsLoading => allChatsStatus == AllChatsStatus.loading;

  bool get isAllChatsSuccess => allChatsStatus == AllChatsStatus.success;

  bool get isAllChatsError => allChatsStatus == AllChatsStatus.error;
}

extension GetMessagesStatusX on ChatState {
  bool get isGetMessagesInitial =>
      getMessagesStatus == GetMessagesStatus.initial;

  bool get isGetMessagesLoading =>
      getMessagesStatus == GetMessagesStatus.loading;

  bool get isGetMessagesSuccess =>
      getMessagesStatus == GetMessagesStatus.success;

  bool get isGetMessagesError => getMessagesStatus == GetMessagesStatus.error;
}

extension SendMessageStatusX on ChatState {
  bool get isSendMessageInitial =>
      sendMessageStatus == SendMessageStatus.initial;

  bool get isSendMessageLoading =>
      sendMessageStatus == SendMessageStatus.loading;

  bool get isSendMessageSuccess =>
      sendMessageStatus == SendMessageStatus.success;

  bool get isSendMessageError => sendMessageStatus == SendMessageStatus.error;
}

extension DeleteChatStatusX on ChatState {
  bool get isDeleteChatInitial => deleteChatStatus == DeleteChatStatus.initial;

  bool get isDeleteChatLoading => deleteChatStatus == DeleteChatStatus.loading;

  bool get isDeleteChatSuccess => deleteChatStatus == DeleteChatStatus.success;

  bool get isDeleteChatError => deleteChatStatus == DeleteChatStatus.error;
}

class ChatState extends Equatable {
  final AllChatsStatus allChatsStatus;
  final String allChatsError;
  final MessagesResponse? allChatResponse;
  final MessagesResponse? filteredChats;
  final GetMessagesStatus? getMessagesStatus;
  final MessagesResponse? messagesResponse;
  final String getMessagesError;
  final SendMessageStatus? sendMessageStatus;
  final String sendMessageError;
  final DeleteChatStatus deleteChatStatus;
  final String deleteChatError;
  final bool? deleteChatResponse;

  const ChatState(
      {this.allChatsStatus = AllChatsStatus.initial,
      this.allChatsError = '',
      this.allChatResponse,
      this.filteredChats,
      this.getMessagesStatus = GetMessagesStatus.initial,
      this.messagesResponse,
      this.getMessagesError = '',
      this.sendMessageStatus = SendMessageStatus.initial,
      this.sendMessageError = '',
      this.deleteChatStatus = DeleteChatStatus.initial,
      this.deleteChatResponse,
      this.deleteChatError = ''});

  ChatState copyWith({
    AllChatsStatus? allChatsStatus,
    String? allChatsError,
    MessagesResponse? allChatResponse,
    MessagesResponse? filteredChats,
    GetMessagesStatus? getMessagesStatus,
    MessagesResponse? messagesResponse,
    String? getMessagesError,
    SendMessageStatus? sendMessageStatus,
    String? sendMessageError,
    String? deleteChatError,
    DeleteChatStatus? deleteChatStatus,
    bool? deleteChatResponse,
  }) {
    return ChatState(
      allChatsStatus: allChatsStatus ?? this.allChatsStatus,
      allChatsError: allChatsError ?? this.allChatsError,
      allChatResponse: allChatResponse ?? this.allChatResponse,
      filteredChats: filteredChats ?? this.filteredChats,
      getMessagesStatus: getMessagesStatus ?? this.getMessagesStatus,
      messagesResponse: messagesResponse ?? this.messagesResponse,
      getMessagesError: getMessagesError ?? this.getMessagesError,
      sendMessageStatus: sendMessageStatus ?? this.sendMessageStatus,
      sendMessageError: sendMessageError ?? this.sendMessageError,
      deleteChatError: deleteChatError ?? this.deleteChatError,
      deleteChatStatus: deleteChatStatus ?? this.deleteChatStatus,
      deleteChatResponse: deleteChatResponse ?? this.deleteChatResponse,
    );
  }

  @override
  List<Object?> get props => [
        allChatsStatus,
        allChatsError,
        allChatResponse,
        filteredChats,
        getMessagesStatus,
        messagesResponse,
        getMessagesError,
        sendMessageStatus,
        sendMessageError,
        deleteChatError,
        deleteChatStatus,
        deleteChatResponse,
      ];
}
