class FriendRequestResponse {
  String? sId;
  User1? user1;
  String? user2;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  FriendRequestResponse(
      {this.sId,
      this.user1,
      this.user2,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.iV});

  FriendRequestResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user1 = json['user1'] != null ? User1.fromJson(json['user1']) : null;
    user2 = json['user2'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (user1 != null) {
      data['user1'] = user1!.toJson();
    }
    data['user2'] = user2;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class User1 {
  String? sId;
  String? firstName;
  String? lastName;
  String? id;

  User1({this.sId, this.firstName, this.lastName, this.id});

  User1.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['id'] = id;
    return data;
  }
}
