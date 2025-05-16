part of 'friends_cubit.dart';

enum FriendsStatus {
  initial,
  loading,
  success,
  error,
}

enum UnFriendStatus {
  initial,
  loading,
  success,
  error,
}

extension UnFriendStatusX on FriendsState {
  bool get isUnFriendInitial => unFriendStatus == UnFriendStatus.initial;

  bool get isUnFriendLoading => unFriendStatus == UnFriendStatus.loading;

  bool get isUnFriendSuccess => unFriendStatus == UnFriendStatus.success;

  bool get isUnFriendError => unFriendStatus == UnFriendStatus.error;
}

extension FriendsStatusX on FriendsState {
  bool get isInitial => status == FriendsStatus.initial;

  bool get isLoading => status == FriendsStatus.loading;

  bool get isSuccess => status == FriendsStatus.success;

  bool get isError => status == FriendsStatus.error;
}

class FriendsState extends Equatable {
  final FriendsStatus status;
  final UnFriendStatus unFriendStatus;
  final String error;
  final FriendsResponse? friends;

  const FriendsState({
    this.status = FriendsStatus.initial,
    this.unFriendStatus = UnFriendStatus.initial,
    this.error = '',
    this.friends,
  });

  FriendsState copyWith({
    FriendsStatus? status,
    UnFriendStatus? unFriendStatus,
    String? error,
    FriendsResponse? friends,
  }) {
    return FriendsState(
      status: status ?? this.status,
      unFriendStatus: unFriendStatus ?? this.unFriendStatus,
      error: error ?? this.error,
      friends: friends ?? this.friends,
    );
  }

  @override
  List<Object?> get props => [status, error, friends, unFriendStatus];
}
