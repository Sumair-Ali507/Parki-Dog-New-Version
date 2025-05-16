import 'package:parki_dog/features/auth/data/models/user.dart';
import 'package:parki_dog/features/dog_owner/data/models/dog.dart';

class CheckIn {
  String? sId;
  AppUser? user;
  String? park;
  Dog? dog;
  String? checkInTime;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CheckIn(
      {this.sId,
      this.user,
      this.park,
      this.dog,
      this.checkInTime,
      this.createdAt,
      this.updatedAt,
      this.iV});

  CheckIn.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? AppUser.fromJson(json['user']) : null;
    park = json['park'];
    dog = json['dog'] != null ? Dog.fromJson(json['dog']) : null;
    checkInTime = json['checkInTime'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['park'] = park;
    if (dog != null) {
      data['dog'] = dog!.toJson();
    }
    data['checkInTime'] = checkInTime;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
