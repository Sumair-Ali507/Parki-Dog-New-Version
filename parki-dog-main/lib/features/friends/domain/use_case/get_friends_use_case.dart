import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/friends/data/models/friends_response.dart';
import 'package:parki_dog/features/friends/domain/repository/base_friends_repository.dart';

class GetFriendsUseCase extends BaseUseCase<FriendsResponse, NoParameters> {
  final BaseFriendsRepository baseFriendsRepository;

  GetFriendsUseCase(this.baseFriendsRepository);

  @override
  Future<(Failure?, FriendsResponse?)> call(NoParameters parameters) {
    return baseFriendsRepository.getFriends(parameters);
  }
}
