import 'package:parki_dog/features/home/data/models/park.dart';

class ParkCheckInsResponse {
  String? status;
  String? message;
  Park? park;

  ParkCheckInsResponse({this.status, this.message, this.park});

  ParkCheckInsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    park = json['data'] != null ? Park.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (park != null) {
      data['data'] = park!.toJson();
    }
    return data;
  }
}
