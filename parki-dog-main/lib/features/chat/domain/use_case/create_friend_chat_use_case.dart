import 'package:equatable/equatable.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/chat/data/models/chat_response.dart';
import 'package:parki_dog/features/chat/domain/repository/base_chat_repository.dart';
class CreateFriendChatUseCase
    extends BaseUseCase<ChatResponse, CreateFriendChatParameters> {
  final BaseChatRepository baseChatRepository;

  CreateFriendChatUseCase(this.baseChatRepository);

  @override
  Future<(Failure?, ChatResponse?)> call(CreateFriendChatParameters parameters) {
    return baseChatRepository.createFriendChat(parameters);
  }
}

class CreateFriendChatParameters extends Equatable {
  final String friendId;

  const CreateFriendChatParameters({
    required this.friendId,
  });

  //to json
  Map<String, dynamic> toJson() => {
    'friendId': friendId,
  };

  @override
  List<Object?> get props => [friendId];

}
