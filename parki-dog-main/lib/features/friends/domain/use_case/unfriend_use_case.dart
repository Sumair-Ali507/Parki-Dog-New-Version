import 'package:equatable/equatable.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/friends/domain/repository/base_friends_repository.dart';

class UnfriendUseCase extends BaseUseCase<bool, UnFriendParameters> {
  final BaseFriendsRepository baseFriendsRepository;

  UnfriendUseCase(this.baseFriendsRepository);

  @override
  Future<(Failure?, bool?)> call(UnFriendParameters parameters) {
    return baseFriendsRepository.unFriend(parameters);
  }
}

class UnFriendParameters extends Equatable {
  final String userId;

  const UnFriendParameters({required this.userId});

  @override
  List<Object?> get props => [userId];
}
