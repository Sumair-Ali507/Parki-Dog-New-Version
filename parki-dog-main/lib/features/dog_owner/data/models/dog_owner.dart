import 'package:parki_dog/features/home/data/models/location.dart';

class DogOwner {
  AppLocation? location;
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? id;

  DogOwner(
      {this.location,
      this.sId,
      this.firstName,
      this.lastName,
      this.email,
      this.id});

  DogOwner.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? AppLocation.fromJson(json['location'])
        : null;
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['_id'] = sId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['id'] = id;
    return data;
  }
}
