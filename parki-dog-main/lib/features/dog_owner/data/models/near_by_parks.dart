import 'package:parki_dog/features/home/data/models/park.dart';

class NearByParksResponse {
  String? status;
  String? message;
  int? result;
  List<Park>? park;

  NearByParksResponse({this.status, this.message, this.result, this.park});

  NearByParksResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'];
    if (json['data'] != null) {
      park = <Park>[];
      json['data'].forEach((v) {
        park!.add(Park.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['result'] = result;
    if (park != null) {
      data['data'] = park!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
