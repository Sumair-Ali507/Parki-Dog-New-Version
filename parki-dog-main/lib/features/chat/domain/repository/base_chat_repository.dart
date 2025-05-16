import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/chat/data/models/chat_response.dart';
import 'package:parki_dog/features/chat/data/models/messages_response.dart';
import 'package:parki_dog/features/chat/domain/use_case/create_chat_use_case.dart';
import 'package:parki_dog/features/chat/domain/use_case/create_friend_chat_use_case.dart';
import 'package:parki_dog/features/chat/domain/use_case/delete_chat_use_case.dart';
import 'package:parki_dog/features/chat/domain/use_case/get_messages_use_case.dart';
import 'package:parki_dog/features/chat/domain/use_case/mark_chat_as_read_use_case.dart';
import 'package:parki_dog/features/chat/domain/use_case/send_messages_use_case.dart';

abstract class BaseChatRepository {
  Future<(Failure?, ChatResponse?)> createChat(CreateChatParameters parameters);

  Future<(Failure?, ChatResponse?)> createFriendChat(
      CreateFriendChatParameters parameters);

  Future<(Failure?, ChatResponse?)> sendMessage(
      SendMessagesParameters parameters);

  Future<(Failure?, MessagesResponse?)> getChats(NoParameters parameters);

  Future<(Failure?, MessagesResponse?)> getMessages(
      GetMessagesParameters parameters);

  Future<(Failure?, bool?)> deleteChat(DeleteChatParameters parameters);

  Future<(Failure?, bool?)> markChatAsRead(MarkChatAsReadParameters parameters);
}
