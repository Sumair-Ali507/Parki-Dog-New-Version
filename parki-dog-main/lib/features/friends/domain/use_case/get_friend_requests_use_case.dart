import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/friends/data/models/friend_requests_response.dart';
import 'package:parki_dog/features/friends/domain/repository/base_friends_repository.dart';

class GetFriendRequestsUseCase
    extends BaseUseCase<FriendRequestsResponse, NoParameters> {
  final BaseFriendsRepository baseFriendsRepository;

  GetFriendRequestsUseCase(this.baseFriendsRepository);

  @override
  Future<(Failure?, FriendRequestsResponse?)> call(NoParameters parameters) {
    return baseFriendsRepository.getFriendRequests(parameters);
  }
}
