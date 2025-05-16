import 'package:equatable/equatable.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/friends/data/models/friend_response.dart';
import 'package:parki_dog/features/friends/domain/repository/base_friends_repository.dart';

class RespondToRequestUseCase
    extends BaseUseCase<FriendResponse, RespondToRequestParameters> {
  final BaseFriendsRepository baseFriendsRepository;

  RespondToRequestUseCase(this.baseFriendsRepository);

  @override
  Future<(Failure?, FriendResponse?)> call(
      RespondToRequestParameters parameters) {
    return baseFriendsRepository.respondToRequest(parameters);
  }
}

class RespondToRequestParameters extends Equatable {
  final String status;
  final String friendShipId;

  const RespondToRequestParameters(
      {required this.status, required this.friendShipId});

  @override
  List<Object> get props => [status, friendShipId];
}
