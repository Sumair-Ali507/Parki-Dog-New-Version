import 'package:equatable/equatable.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/chat/domain/repository/base_chat_repository.dart';
class DeleteChatUseCase
    extends BaseUseCase<bool, DeleteChatParameters> {
  final BaseChatRepository baseChatRepository;

  DeleteChatUseCase(this.baseChatRepository);

  @override
  Future<(Failure?, bool?)> call(DeleteChatParameters parameters) {
    return baseChatRepository.deleteChat(parameters);
  }
}

class DeleteChatParameters extends Equatable {
  final String chatId;

  const DeleteChatParameters({
    required this.chatId,
  });

  @override
  List<Object?> get props => [chatId];

}
