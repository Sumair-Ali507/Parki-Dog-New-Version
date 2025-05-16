import 'package:parki_dog/features/friends/export/friends_export.dart';

part 'friends_state.dart';

class FriendsCubit extends Cubit<FriendsState> {
  GetFriendsUseCase getFriendsUseCase;
  UnfriendUseCase unfriendUseCase;

  FriendsCubit(this.getFriendsUseCase, this.unfriendUseCase)
      : super(const FriendsState());

  getFriends() async {
    emit(state.copyWith(status: FriendsStatus.loading));
    final result = await getFriendsUseCase(const NoParameters());
    if (result.$1 != null) {
      emit(state.copyWith(
        status: FriendsStatus.error,
        error: result.$1!.message.tr(),
      ));
    } else {
      emit(state.copyWith(
        status: FriendsStatus.success,
        friends: result.$2,
      ));
    }
  }

  deleteFriend(String userId) async {
    emit(state.copyWith(unFriendStatus: UnFriendStatus.loading));
    final result = await unfriendUseCase(UnFriendParameters(userId: userId));
    if (result.$1 != null) {
      emit(state.copyWith(
        unFriendStatus: UnFriendStatus.error,
        error: result.$1!.message.tr(),
      ));
    } else {
      final updatedFriends = state.friends?.friends
          ?.where((friendResponse) => friendResponse.friend?.id != userId)
          .toList();
      emit(state.copyWith(
        unFriendStatus: UnFriendStatus.success,
        friends: state.friends?.copyWith(friends: updatedFriends),
      ));
    }
  }
}
