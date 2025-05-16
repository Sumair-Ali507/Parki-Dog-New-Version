import 'package:equatable/equatable.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/chat/data/models/chat_response.dart';
import 'package:parki_dog/features/chat/domain/repository/base_chat_repository.dart';
class CreateChatUseCase
    extends BaseUseCase<ChatResponse, CreateChatParameters> {
  final BaseChatRepository baseChatRepository;

  CreateChatUseCase(this.baseChatRepository);

  @override
  Future<(Failure?, ChatResponse?)> call(CreateChatParameters parameters) {
    return baseChatRepository.createChat(parameters);
  }
}

class CreateChatParameters extends Equatable {
  final String chatName;
  final List<String> participants;

  const CreateChatParameters({
    required this.chatName,
    required this.participants,
  });

  //to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chatName'] = chatName;
    data['participants'] = participants;
    return data;
  }

  @override
  List<Object?> get props => [chatName, participants];

}
