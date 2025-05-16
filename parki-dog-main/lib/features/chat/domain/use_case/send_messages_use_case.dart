import 'package:equatable/equatable.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/chat/data/models/chat_response.dart';
import 'package:parki_dog/features/chat/domain/repository/base_chat_repository.dart';
class SendMessagesUseCase
    extends BaseUseCase<ChatResponse, SendMessagesParameters> {
  final BaseChatRepository baseChatRepository;

  SendMessagesUseCase(this.baseChatRepository);

  @override
  Future<(Failure?, ChatResponse?)> call(SendMessagesParameters parameters) {
    return baseChatRepository.sendMessage(parameters);
  }
}

class SendMessagesParameters extends Equatable {
  final String chatId;
  final String content;

  const SendMessagesParameters({
    required this.chatId,
    required this.content,
  });

  Map<String, dynamic> toJson() => {
        'chatId': chatId,
        'content': content,
      };

  @override
  List<Object?> get props => [chatId, content];

}
