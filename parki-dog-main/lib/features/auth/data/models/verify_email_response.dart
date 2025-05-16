import 'package:parki_dog/features/home/data/models/location.dart';

class VerifyEmailResponse {
  String? status;
  String? message;
  VerifyData? data;

  VerifyEmailResponse({this.status, this.message, this.data});

  VerifyEmailResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? VerifyData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class VerifyData {
  AppLocation? location;
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? role;
  String? phone;
  String? country;
  List<String>? ownedDogs;
  bool? isLoggedIn;
  bool? isVerified;
  String? passwordChangeDate;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? verifyEmailExpires;
  String? verifyEmailToken;
  String? id;

  VerifyData(
      {this.location,
      this.sId,
      this.firstName,
      this.lastName,
      this.email,
      this.role,
      this.phone,
      this.country,
      this.ownedDogs,
      this.isLoggedIn,
      this.isVerified,
      this.passwordChangeDate,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.verifyEmailExpires,
      this.verifyEmailToken,
      this.id});

  VerifyData.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? AppLocation.fromJson(json['location'])
        : null;
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    role = json['role'];
    phone = json['phone'];
    country = json['country'];
    ownedDogs = json['ownedDogs'].cast<String>();
    isLoggedIn = json['isLoggedIn'];
    isVerified = json['isVerified'];
    passwordChangeDate = json['passwordChangeDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    verifyEmailExpires = json['verifyEmailExpires'];
    verifyEmailToken = json['verifyEmailToken'];
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
    data['role'] = role;
    data['phone'] = phone;
    data['country'] = country;
    data['ownedDogs'] = ownedDogs;
    data['isLoggedIn'] = isLoggedIn;
    data['isVerified'] = isVerified;
    data['passwordChangeDate'] = passwordChangeDate;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['verifyEmailExpires'] = verifyEmailExpires;
    data['verifyEmailToken'] = verifyEmailToken;
    data['id'] = id;
    return data;
  }
}
