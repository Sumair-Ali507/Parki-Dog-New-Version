import 'package:parki_dog/features/chat/data/models/participant.dart';

class LastMessage {
  String? sId;
  String? chat;
  String? content;
  Participant? sender;
  String? createdAt;
  String? updatedAt;
  int? iV;

  LastMessage(
      {this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.sender,
      this.chat,
      this.content});

  LastMessage.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sender =
        json['sender'] != null ? Participant.fromJson(json['sender']) : null;
    content = json['content'];
    chat = json['chat'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (sender != null) {
      data['sender'] = sender!.toJson();
    }
    data['chat'] = chat;
    data['content'] = content;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }

  LastMessage copyWith({
    String? sId,
    Participant? sender,
    String? content,
    String? chat,
    String? createdAt,
    String? updatedAt,
    int? iV,
  }) {
    return LastMessage(
        sId: sId ?? this.sId,
        sender: sender ?? this.sender,
        content: content ?? this.content,
        chat: chat ?? this.chat,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        iV: iV ?? this.iV);
  }
}
