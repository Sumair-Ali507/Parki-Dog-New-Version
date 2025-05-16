import 'package:parki_dog/features/chat/data/models/chat_data.dart';

class ChatResponse {
  String? status;
  String? message;
  ChatData? chatData;

  ChatResponse({this.status, this.message, this.chatData});

  ChatResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    chatData = json['data'] != null ? ChatData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (chatData != null) {
      data['data'] = chatData!.toJson();
    }
    return data;
  }
}


