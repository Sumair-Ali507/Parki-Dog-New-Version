import 'package:parki_dog/core/base_data_source/remote/base_app_remote_data_source.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/network/make_api_call.dart';
import 'package:parki_dog/core/network/network_constants.dart';
import 'package:parki_dog/features/chat/data/models/chat_response.dart';
import 'package:parki_dog/features/chat/data/models/messages_response.dart';
import 'package:parki_dog/features/chat/domain/use_case/create_chat_use_case.dart';
import 'package:parki_dog/features/chat/domain/use_case/create_friend_chat_use_case.dart';
import 'package:parki_dog/features/chat/domain/use_case/delete_chat_use_case.dart';
import 'package:parki_dog/features/chat/domain/use_case/get_messages_use_case.dart';
import 'package:parki_dog/features/chat/domain/use_case/mark_chat_as_read_use_case.dart';
import 'package:parki_dog/features/chat/domain/use_case/send_messages_use_case.dart';

abstract class BaseChatRemoteDataSource extends BaseAppRemoteDataSource {
  Future<ChatResponse> createChat(CreateChatParameters parameters);

  Future<ChatResponse> createFriendChat(CreateFriendChatParameters parameters);

  Future<ChatResponse> sendMessage(SendMessagesParameters parameters);

  Future<MessagesResponse> getChats(NoParameters parameters);

  Future<MessagesResponse> getMessages(GetMessagesParameters parameters);

  Future<bool> deleteChat(DeleteChatParameters parameters);

  Future<bool> markChatAsRead(MarkChatAsReadParameters parameters);
}

class ChatRemoteDataSource extends BaseChatRemoteDataSource {
  @override
  Future<ChatResponse> createChat(CreateChatParameters parameters) async {
    return await makeApiCall(
        url: NetworkConstants.chats,
        method: HttpMethod.post,
        body: parameters.toJson(),
        fromJson: (data) => ChatResponse.fromJson(data));
  }

  @override
  Future<ChatResponse> createFriendChat(
      CreateFriendChatParameters parameters) async {
    return await makeApiCall(
        url: NetworkConstants.chatsFriend,
        method: HttpMethod.post,
        body: parameters.toJson(),
        fromJson: (data) => ChatResponse.fromJson(data));
  }

  @override
  Future<bool> deleteChat(DeleteChatParameters parameters) async {
    return await makeApiCall(
        url: '${NetworkConstants.chats}/${parameters.chatId}',
        method: HttpMethod.delete,
        fromJson: (data) => true);
  }

  @override
  Future<MessagesResponse> getChats(NoParameters parameters) async {
    return await makeApiCall(
        url: NetworkConstants.chats,
        method: HttpMethod.get,
        fromJson: (data) => MessagesResponse.fromJson(data));
  }

  @override
  Future<MessagesResponse> getMessages(GetMessagesParameters parameters) async {
    return await makeApiCall(
        url: '${NetworkConstants.chats}/${parameters.chatId}/messages',
        method: HttpMethod.get,
        fromJson: (data) => MessagesResponse.fromJson(data));
  }

  @override
  Future<bool> markChatAsRead(MarkChatAsReadParameters parameters) async {
    return await makeApiCall(
        url: '${NetworkConstants.chats}/${parameters.chatId}/read',
        method: HttpMethod.patch,
        fromJson: (data) => true);
  }

  @override
  Future<ChatResponse> sendMessage(SendMessagesParameters parameters) async {
    return await makeApiCall(
        url: NetworkConstants.chatsMessage,
        method: HttpMethod.post,
        body: parameters.toJson(),
        fromJson: (data) => ChatResponse.fromJson(data));
  }
}
