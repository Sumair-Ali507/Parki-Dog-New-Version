import 'package:parki_dog/features/friends/data/models/friend_response.dart';

class FriendsResponse {
  String? status;
  int? result;
  List<FriendResponse>? friends;

  FriendsResponse({this.status, this.result, this.friends});

  FriendsResponse copyWith({
    String? status,
    int? result,
    List<FriendResponse>? friends,
  }) {
    return FriendsResponse(
      status: status ?? this.status,
      result: result ?? this.result,
      friends: friends ?? this.friends,
    );
  }

  FriendsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result'];
    if (json['data'] != null) {
      friends = <FriendResponse>[];
      json['data'].forEach((v) {
        friends!.add(FriendResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['result'] = result;
    if (friends != null) {
      data['data'] = friends!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
