class FriendResponse {
  String? friendshipId;
  Friend? friend;

  FriendResponse({this.friendshipId, this.friend});

  FriendResponse.fromJson(Map<String, dynamic> json) {
    friendshipId = json['friendshipId'];
    friend = json['friend'] != null ? Friend.fromJson(json['friend']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['friendshipId'] = friendshipId;
    if (friend != null) {
      data['friend'] = friend!.toJson();
    }
    return data;
  }
}

class Friend {
  String? id;
  String? firstName;
  String? lastName;
  String? email;

  Friend({this.id, this.firstName, this.lastName, this.email});

  Friend.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    return data;
  }
}
