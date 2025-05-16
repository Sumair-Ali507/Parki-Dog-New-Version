import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/friends/data/models/friend_request_response.dart';
import 'package:parki_dog/features/friends/data/models/friend_requests_response.dart';
import 'package:parki_dog/features/friends/data/models/friend_response.dart';
import 'package:parki_dog/features/friends/data/models/friends_response.dart';
import 'package:parki_dog/features/friends/domain/use_case/respond_to_request_use_case.dart';
import 'package:parki_dog/features/friends/domain/use_case/send_friend_request_use_case.dart';
import 'package:parki_dog/features/friends/domain/use_case/unfriend_use_case.dart';

abstract class BaseFriendsRepository {
  Future<(Failure?, FriendRequestResponse?)> sendFriendRequest(
      SendFriendRequestParameters parameters); //userid param
  Future<(Failure?, FriendRequestsResponse?)> getFriendRequests(
      NoParameters parameters);

  Future<(Failure?, FriendsResponse?)> getFriends(NoParameters parameters);

  Future<(Failure?, FriendResponse?)> respondToRequest(
      RespondToRequestParameters parameters); //status param

  Future<(Failure?, bool?)> unFriend(UnFriendParameters parameters);
}
