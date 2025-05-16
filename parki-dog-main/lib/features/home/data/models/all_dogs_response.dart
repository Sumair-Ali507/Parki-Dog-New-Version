import 'package:parki_dog/features/dog_owner/data/models/dogs_data.dart';

class AllDogsResponse {
  String? status;
  String? message;
  int? result;
  List<DogsData>? dogsData;

  AllDogsResponse({this.status, this.message, this.result, this.dogsData});

  AllDogsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'];
    if (json['data'] != null) {
      dogsData = <DogsData>[];
      json['data'].forEach((v) {
        dogsData!.add(DogsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['result'] = result;
    if (dogsData != null) {
      data['data'] = dogsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
