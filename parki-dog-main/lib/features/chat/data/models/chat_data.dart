import 'package:parki_dog/features/chat/data/models/last_message.dart';
import 'package:parki_dog/features/chat/data/models/participant.dart';

class ChatData {
  String? sId;
  String? chatName;
  String? type;
  String? chat;
  String? content;
  List<Participant>? participants;
  Participant? sender;
  String? creator;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? unreadCount;
  LastMessage? lastMessage;

  ChatData(
      {this.sId,
      this.chatName,
      this.type,
      this.participants,
      this.creator,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.unreadCount,
      this.lastMessage,
      this.chat,
      this.content,
      this.sender});

  ChatData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    chatName = json['chatName'];
    type = json['type'];
    if (json['participants'] != null) {
      participants = <Participant>[];
      json['participants'].forEach((v) {
        participants!.add(Participant.fromJson(v));
      });
    }
    sender =
        json['sender'] != null ? Participant.fromJson(json['sender']) : null;
    creator = json['creator'];
    content = json['content'];
    chat = json['chat'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    unreadCount = json['unreadCount'];
    lastMessage = json['lastMessage'] != null
        ? LastMessage.fromJson(json['lastMessage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['chatName'] = chatName;
    data['type'] = type;
    if (participants != null) {
      data['participants'] = participants!.map((v) => v.toJson()).toList();
    }
    data['chat'] = chat;
    data['content'] = content;
    if (sender != null) {
      data['sender'] = sender!.toJson();
    }
    data['creator'] = creator;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['unreadCount'] = unreadCount;
    if (lastMessage != null) {
      data['lastMessage'] = lastMessage!.toJson();
    }
    return data;
  }

  ChatData copyWith(
      {String? sId,
      String? chatName,
      String? type,
      List<Participant>? participants,
      String? creator,
      String? content,
      String? chat,
      String? createdAt,
      String? updatedAt,
      int? iV,
      int? unreadCount,
      LastMessage? lastMessage,
      Participant? sender}) {
    return ChatData(
        sId: sId ?? this.sId,
        chatName: chatName ?? this.chatName,
        type: type ?? this.type,
        participants: participants ?? this.participants,
        creator: creator ?? this.creator,
        content: content ?? this.content,
        chat: chat ?? this.chat,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        iV: iV ?? this.iV,
        unreadCount: unreadCount ?? this.unreadCount,
        lastMessage: lastMessage ?? this.lastMessage,
        sender: sender ?? this.sender);
  }
}
