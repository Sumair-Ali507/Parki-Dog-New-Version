class NotificationsResponse {
  String? status;
  String? message;
  int? result;
  List<AppNotification>? notifications;

  NotificationsResponse(
      {this.status, this.message, this.result, this.notifications});

  NotificationsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'];
    if (json['data'] != null) {
      notifications = <AppNotification>[];
      json['data'].forEach((v) {
        notifications!.add(AppNotification.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['result'] = result;
    if (notifications != null) {
      data['data'] = notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AppNotification {
  String? sId;
  String? recipient;
  String? type;
  Sender? sender;
  bool? read;
  String? createdAt;
  String? updatedAt;
  int? iV;
  bool? isLoading;

  AppNotification(
      {this.sId,
      this.recipient,
      this.type,
      this.sender,
      this.read,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.isLoading = false});

  AppNotification.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    recipient = json['recipient'];
    type = json['type'];
    sender = json['sender'] != null ? Sender.fromJson(json['sender']) : null;
    read = json['read'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['recipient'] = recipient;
    data['type'] = type;
    if (sender != null) {
      data['sender'] = sender!.toJson();
    }
    data['read'] = read;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }

  AppNotification copyWith({
    String? sId,
    String? recipient,
    String? type,
    Sender? sender,
    bool? read,
    String? createdAt,
    String? updatedAt,
    int? iV,
    bool? isLoading,
  }) {
    return AppNotification(
        sId: sId ?? this.sId,
        recipient: recipient ?? this.recipient,
        type: type ?? this.type,
        sender: sender ?? this.sender,
        read: read ?? this.read,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        iV: iV ?? this.iV,
        isLoading: isLoading ?? this.isLoading);
  }
}

class Sender {
  String? sId;
  String? firstName;
  String? lastName;
  String? id;

  Sender({this.sId, this.firstName, this.lastName, this.id});

  Sender.fromJson(Map<String, dynamic> json) {
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
