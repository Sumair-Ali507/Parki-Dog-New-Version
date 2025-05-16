import 'package:equatable/equatable.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/chat/data/models/messages_response.dart';
import 'package:parki_dog/features/chat/domain/repository/base_chat_repository.dart';
class GetMessagesUseCase
    extends BaseUseCase<MessagesResponse, GetMessagesParameters> {
  final BaseChatRepository baseChatRepository;

  GetMessagesUseCase(this.baseChatRepository);

  @override
  Future<(Failure?, MessagesResponse?)> call(GetMessagesParameters parameters) {
    return baseChatRepository.getMessages(parameters);
  }
}

class GetMessagesParameters extends Equatable {
  final String chatId;

  const GetMessagesParameters({
    required this.chatId,
  });

  @override
  List<Object?> get props => [chatId];

}
