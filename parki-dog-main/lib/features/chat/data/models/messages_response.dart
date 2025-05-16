import 'package:parki_dog/features/chat/data/models/chat_data.dart';

class MessagesResponse {
  String? status;
  String? message;
  int? result;
  List<ChatData>? getChatData;

  MessagesResponse({this.status, this.message, this.result, this.getChatData});

  MessagesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'];
    if (json['data'] != null) {
      getChatData = <ChatData>[];
      json['data'].forEach((v) {
        getChatData!.add(ChatData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['result'] = result;
    if (getChatData != null) {
      data['data'] = getChatData!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  MessagesResponse copyWith({
    String? status,
    String? message,
    int? result,
    List<ChatData>? getChatData,
  }) {
    return MessagesResponse(
      status: status ?? this.status,
      message: message ?? this.message,
      result: result ?? this.result,
      getChatData: getChatData ?? this.getChatData,
    );
  }
}

