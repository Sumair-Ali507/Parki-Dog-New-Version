import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/helpers/app_preferences.dart';
import 'package:parki_dog/core/services/service_locator.dart';
import 'package:parki_dog/features/chat/data/models/chat_data.dart';
import 'package:parki_dog/features/chat/data/models/messages_response.dart';
import 'package:parki_dog/features/chat/domain/use_case/delete_chat_use_case.dart';
import 'package:parki_dog/features/chat/domain/use_case/get_chats_use_case.dart';
import 'package:parki_dog/features/chat/domain/use_case/get_messages_use_case.dart';
import 'package:parki_dog/features/chat/domain/use_case/send_messages_use_case.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  GetChatsUseCase getChatsUseCase;
  GetMessagesUseCase getMessagesUseCase;
  SendMessagesUseCase sendMessagesUseCase;
  DeleteChatUseCase deleteChatUseCase;
  final TextEditingController searchFieldController = TextEditingController();
  @override
  Future<void> close() {
    searchFieldController.dispose();
    return super.close();
  }

  ChatBloc(this.getChatsUseCase, this.getMessagesUseCase,
      this.sendMessagesUseCase, this.deleteChatUseCase)
      : super(const ChatState()) {
    on<GetChatsEvent>(_getChats);
    on<SearchChatsEvent>(_searchChats);
    on<GetMessagesEvent>(_getMessages);
    on<SendMessagesEvent>(_sendMessage);
    on<NewMessageReceivedEvent>(_newMessageReceived);
    on<DeleteChatEvent>(_deleteChat);
  }

  FutureOr<void> _getChats(GetChatsEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(allChatsStatus: AllChatsStatus.loading));
    final result = await getChatsUseCase(const NoParameters());
    if (result.$1 != null) {
      emit(state.copyWith(
        allChatsStatus: AllChatsStatus.error,
        allChatsError: result.$1!.message.tr(),
      ));
    } else {
      emit(state.copyWith(
        allChatsStatus: AllChatsStatus.success,
        allChatResponse: result.$2,
        filteredChats: result.$2,
      ));
    }
  }

  FutureOr<void> _searchChats(SearchChatsEvent event, Emitter<ChatState> emit) {
    final query = event.query.toLowerCase();

    // If query is empty, restore all chats
    if (query.isEmpty) {
      emit(state.copyWith(filteredChats: state.allChatResponse));
    } else {
      // Otherwise, filter the chats
      final filteredChats = state.allChatResponse?.getChatData
          ?.where(
              (chat) => chat.chatName?.toLowerCase().contains(query) ?? false)
          .toList();

      emit(state.copyWith(
        filteredChats: MessagesResponse(getChatData: filteredChats),
      ));
    }
  }

  FutureOr<void> _getMessages(
      GetMessagesEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(getMessagesStatus: GetMessagesStatus.loading));
    final result =
        await getMessagesUseCase(GetMessagesParameters(chatId: event.chatId));
    if (result.$1 != null) {
      emit(state.copyWith(
        getMessagesStatus: GetMessagesStatus.error,
        getMessagesError: result.$1!.message.tr(),
      ));
    } else {
      emit(state.copyWith(
        getMessagesStatus: GetMessagesStatus.success,
        messagesResponse: result.$2,
      ));
    }
  }

  FutureOr<void> _sendMessage(
      SendMessagesEvent event, Emitter<ChatState> emit) async {
    final result = await sendMessagesUseCase(
        SendMessagesParameters(chatId: event.chatId, content: event.content));
    if (result.$1 != null) {
      emit(state.copyWith(
        sendMessageError: result.$1!.message.tr(),
        sendMessageStatus: SendMessageStatus.error,
      ));
    } else {
      // state.messagesResponse!.getChatData!.insert(state.messagesResponse!.getChatData!.length,result.$2!.chatData!);
      emit(state.copyWith(
        sendMessageStatus: SendMessageStatus.success,
        messagesResponse:
            // state.messagesResponse,

            state.messagesResponse!.copyWith(
          getChatData: [
            ...state.messagesResponse!.getChatData!,
            result.$2!.chatData!,
          ],
        ),
      ));
    }
  }

  FutureOr<void> _newMessageReceived(
      NewMessageReceivedEvent event, Emitter<ChatState> emit) async {
    // Convert the incoming JSON map into a ChatData instance.
    String currentUserId = await getIt.get<AppPreferences>().getCurrentUser;
    final newMessage = ChatData.fromJson(event.messageData);
    if (currentUserId == newMessage.sender?.id) {
      emit(state.copyWith(messagesResponse: state.messagesResponse));
    } else {
      if (state.messagesResponse != null &&
          state.messagesResponse!.getChatData != null) {
        final updatedMessages =
            List<ChatData>.from(state.messagesResponse!.getChatData!);
        updatedMessages.add(newMessage);
        emit(state.copyWith(
          messagesResponse:
              state.messagesResponse!.copyWith(getChatData: updatedMessages),
        ));
      } else {
        emit(state.copyWith(
            messagesResponse: MessagesResponse(getChatData: [newMessage])));
      }
    }
  }

  FutureOr<void> _deleteChat(
      DeleteChatEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(deleteChatStatus: DeleteChatStatus.loading));
    final result =
        await deleteChatUseCase(DeleteChatParameters(chatId: event.chatId));
    if (result.$1 != null) {
      emit(state.copyWith(
        deleteChatStatus: DeleteChatStatus.error,
        deleteChatError: result.$1!.message.tr(),
      ));
    } else {
      // Filter out the chat with the matching id
      final updatedChatData = state.allChatResponse?.getChatData
          ?.where((chat) => chat.sId != event.chatId)
          .toList();

      final updatedAllChatResponse = state.allChatResponse?.copyWith(
        getChatData: updatedChatData,
      );
      emit(state.copyWith(
          deleteChatStatus: DeleteChatStatus.success,
          deleteChatResponse: result.$2,
          allChatResponse: updatedAllChatResponse));
    }
  }
}
