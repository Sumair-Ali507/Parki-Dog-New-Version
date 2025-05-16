import 'package:equatable/equatable.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/chat/domain/repository/base_chat_repository.dart';
class MarkChatAsReadUseCase
    extends BaseUseCase<bool, MarkChatAsReadParameters> {
  final BaseChatRepository baseChatRepository;

  MarkChatAsReadUseCase(this.baseChatRepository);

  @override
  Future<(Failure?, bool?)> call(MarkChatAsReadParameters parameters) {
    return baseChatRepository.markChatAsRead(parameters);
  }
}

class MarkChatAsReadParameters extends Equatable {
  final String chatId;

  const MarkChatAsReadParameters({
    required this.chatId,
  });

  @override
  List<Object?> get props => [chatId];

}
