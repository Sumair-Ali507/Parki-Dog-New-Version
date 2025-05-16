import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/chat/data/models/messages_response.dart';
import 'package:parki_dog/features/chat/domain/repository/base_chat_repository.dart';

class GetChatsUseCase
    extends BaseUseCase<MessagesResponse, NoParameters> {
  final BaseChatRepository baseChatRepository;

  GetChatsUseCase(this.baseChatRepository);

  @override
  Future<(Failure?, MessagesResponse?)> call(NoParameters parameters) {
    return baseChatRepository.getChats(parameters);
  }
}
