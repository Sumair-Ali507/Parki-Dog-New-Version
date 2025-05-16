import 'package:equatable/equatable.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/friends/data/models/friend_request_response.dart';
import 'package:parki_dog/features/friends/domain/repository/base_friends_repository.dart';

class SendFriendRequestUseCase
    extends BaseUseCase<FriendRequestResponse, SendFriendRequestParameters> {
  final BaseFriendsRepository baseFriendsRepository;

  SendFriendRequestUseCase(this.baseFriendsRepository);

  @override
  Future<(Failure?, FriendRequestResponse?)> call(
      SendFriendRequestParameters parameters) {
    return baseFriendsRepository.sendFriendRequest(parameters);
  }
}

class SendFriendRequestParameters extends Equatable {
  final String userId;

  const SendFriendRequestParameters({required this.userId});

  @override
  List<Object> get props => [userId];
}
