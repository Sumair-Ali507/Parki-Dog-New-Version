import 'package:dio/dio.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/error_handler.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/chat/data/datasource/remote/chat_remote_data_source.dart';
import 'package:parki_dog/features/chat/data/models/chat_response.dart';
import 'package:parki_dog/features/chat/data/models/messages_response.dart';
import 'package:parki_dog/features/chat/domain/repository/base_chat_repository.dart';
import 'package:parki_dog/features/chat/domain/use_case/create_chat_use_case.dart';
import 'package:parki_dog/features/chat/domain/use_case/create_friend_chat_use_case.dart';
import 'package:parki_dog/features/chat/domain/use_case/delete_chat_use_case.dart';
import 'package:parki_dog/features/chat/domain/use_case/get_messages_use_case.dart';
import 'package:parki_dog/features/chat/domain/use_case/mark_chat_as_read_use_case.dart';
import 'package:parki_dog/features/chat/domain/use_case/send_messages_use_case.dart';

class ChatRepository extends BaseChatRepository {
  final BaseChatRemoteDataSource baseChatRemoteDataSource;

  ChatRepository(this.baseChatRemoteDataSource);

  @override
  Future<(Failure?, ChatResponse?)> createChat(
      CreateChatParameters parameters) async {
    try {
      final result = await baseChatRemoteDataSource.createChat(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }

  @override
  Future<(Failure?, ChatResponse?)> createFriendChat(
      CreateFriendChatParameters parameters) async {
    try {
      final result =
          await baseChatRemoteDataSource.createFriendChat(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }

  @override
  Future<(Failure?, bool?)> deleteChat(DeleteChatParameters parameters) async {
    try {
      final result = await baseChatRemoteDataSource.deleteChat(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }

  @override
  Future<(Failure?, MessagesResponse?)> getChats(
      NoParameters parameters) async {
    try {
      final result = await baseChatRemoteDataSource.getChats(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }

  @override
  Future<(Failure?, MessagesResponse?)> getMessages(
      GetMessagesParameters parameters) async {
    try {
      final result = await baseChatRemoteDataSource.getMessages(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }

  @override
  Future<(Failure?, bool?)> markChatAsRead(
      MarkChatAsReadParameters parameters) async {
    try {
      final result = await baseChatRemoteDataSource.markChatAsRead(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }

  @override
  Future<(Failure?, ChatResponse?)> sendMessage(
      SendMessagesParameters parameters) async {
    try {
      final result = await baseChatRemoteDataSource.sendMessage(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }
}
