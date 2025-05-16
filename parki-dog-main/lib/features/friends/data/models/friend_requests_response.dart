import 'package:parki_dog/features/friends/data/models/friend_request_response.dart';

class FriendRequestsResponse {
  String? status;
  int? result;
  List<FriendRequestResponse>? friendRequests;

  FriendRequestsResponse({this.status, this.result, this.friendRequests});

  FriendRequestsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result'];
    if (json['data'] != null) {
      friendRequests = <FriendRequestResponse>[];
      json['data'].forEach((v) {
        friendRequests!.add(FriendRequestResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['result'] = result;
    if (friendRequests != null) {
      data['data'] = friendRequests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
