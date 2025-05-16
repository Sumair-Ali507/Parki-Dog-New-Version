import 'package:parki_dog/core/base_data_source/remote/base_app_remote_data_source.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/network/make_api_call.dart';
import 'package:parki_dog/core/network/network_constants.dart';
import 'package:parki_dog/features/friends/data/models/friend_request_response.dart';
import 'package:parki_dog/features/friends/data/models/friend_requests_response.dart';
import 'package:parki_dog/features/friends/data/models/friend_response.dart';
import 'package:parki_dog/features/friends/data/models/friends_response.dart';
import 'package:parki_dog/features/friends/domain/use_case/respond_to_request_use_case.dart';
import 'package:parki_dog/features/friends/domain/use_case/send_friend_request_use_case.dart';
import 'package:parki_dog/features/friends/domain/use_case/unfriend_use_case.dart';

abstract class BaseFriendsRemoteDataSource extends BaseAppRemoteDataSource {
  Future<FriendRequestResponse> sendFriendRequest(
      SendFriendRequestParameters parameters);

  Future<FriendRequestsResponse> getFriendRequests(NoParameters parameters);

  Future<FriendsResponse> getFriends(NoParameters parameters);

  Future<FriendResponse> respondToRequest(
      RespondToRequestParameters parameters);

  Future<bool> unFriend(UnFriendParameters parameters);
}

class FriendsRemoteDataSource extends BaseFriendsRemoteDataSource {
  @override
  Future<FriendRequestsResponse> getFriendRequests(
      NoParameters parameters) async {
    return await makeApiCall(
        url: NetworkConstants.friendsRequests,
        method: HttpMethod.get,
        fromJson: (data) => FriendRequestsResponse.fromJson(data));
  }

  @override
  Future<FriendsResponse> getFriends(NoParameters parameters) async {
    return await makeApiCall(
        url: NetworkConstants.friends,
        method: HttpMethod.get,
        fromJson: (data) => FriendsResponse.fromJson(data));
  }

  @override
  Future<FriendResponse> respondToRequest(
      RespondToRequestParameters parameters) async {
    return await makeApiCall(
        url: '${NetworkConstants.friendsRequest}/${parameters.friendShipId}',
        method: HttpMethod.patch,
        body: {'status': parameters.status},
        fromJson: (data) => FriendResponse.fromJson(data['data']));
  }

  @override
  Future<FriendRequestResponse> sendFriendRequest(
      SendFriendRequestParameters parameters) async {
    return await makeApiCall(
        url: NetworkConstants.friendsRequest,
        method: HttpMethod.post,
        fromJson: (data) => FriendRequestResponse.fromJson(data['data']));
  }

  @override
  Future<bool> unFriend(UnFriendParameters parameters) async {
    return await makeApiCall(
        url: '${NetworkConstants.friends}/${parameters.userId}',
        method: HttpMethod.delete,
        fromJson: (data) => true);
  }
}
