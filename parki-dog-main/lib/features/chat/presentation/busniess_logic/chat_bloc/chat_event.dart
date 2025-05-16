part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();
}

class GetChatsEvent extends ChatEvent {
  @override
  List<Object?> get props => [];
}

class SearchChatsEvent extends ChatEvent {
  final String query;

  const SearchChatsEvent({required this.query});
  @override
  List<Object?> get props => [query];
}

class CreateFriendChatEvent extends ChatEvent {
  final String friendId;

  const CreateFriendChatEvent({required this.friendId});

  @override
  List<Object?> get props => [friendId];
}

class SendMessagesEvent extends ChatEvent {
  final String chatId;
  final String content;

  const SendMessagesEvent({required this.chatId, required this.content});

  @override
  List<Object?> get props => [chatId, content];
}

class GetMessagesEvent extends ChatEvent {
  final String chatId;

  const GetMessagesEvent({required this.chatId});

  @override
  List<Object?> get props => [chatId];
}

class DeleteChatEvent extends ChatEvent {
  final String chatId;

  const DeleteChatEvent({required this.chatId});

  @override
  List<Object?> get props => [chatId];
}

class NewMessageReceivedEvent extends ChatEvent {
  final Map<String, dynamic> messageData;
  const NewMessageReceivedEvent({required this.messageData});

  @override
  List<Object?> get props => [messageData];
}
