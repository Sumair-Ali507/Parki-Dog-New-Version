class SendFriendResponse {
  String? status;
  String? message;
  SendFriendResponseData? data;

  SendFriendResponse({this.status, this.message, this.data});

  SendFriendResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? SendFriendResponseData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SendFriendResponseData {
  String? user1;
  String? user2;
  String? status;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SendFriendResponseData(
      {this.user1,
      this.user2,
      this.status,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  SendFriendResponseData.fromJson(Map<String, dynamic> json) {
    user1 = json['user1'];
    user2 = json['user2'];
    status = json['status'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user1'] = user1;
    data['user2'] = user2;
    data['status'] = status;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
