import 'package:parki_dog/features/home/data/models/park.dart';

class AllParksResponse {
  String? status;
  String? message;
  int? result;
  List<Park>? parks;

  AllParksResponse({this.status, this.message, this.result, this.parks});

  AllParksResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'];
    if (json['data'] != null) {
      parks = <Park>[];
      json['data'].forEach((v) {
        parks!.add(Park.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['result'] = result;
    if (parks != null) {
      data['data'] = parks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
