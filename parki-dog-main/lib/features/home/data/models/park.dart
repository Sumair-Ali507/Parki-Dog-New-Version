import 'package:parki_dog/features/home/data/models/checkin.dart';
import 'package:parki_dog/features/home/data/models/location.dart';
import 'package:parki_dog/features/home/data/models/reviews.dart';

class Park {
  AppLocation? location;
  String? sId;
  String? name;
  String? status;
  String? parkType;
  List<CheckIn>? currentCheckins;
  String? googlePlaceId;
  String? formattedAddress;
  List<String>? photos;
  double? rating;
  List<Reviews>? reviews;

  Park(
      {this.location,
      this.sId,
      this.name,
      this.status,
      this.parkType,
      this.currentCheckins,
      this.googlePlaceId,
      this.formattedAddress,
      this.photos,
      this.rating,
      this.reviews});

  Park.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? AppLocation.fromJson(json['location'])
        : null;
    sId = json['_id'];
    name = json['name'];
    status = json['status'];
    parkType = json['parkType'];
    if (json['currentCheckins'] != null) {
      currentCheckins = <CheckIn>[];
      json['currentCheckins'].forEach((v) {
        currentCheckins!.add(CheckIn.fromJson(v));
      });
    }
    googlePlaceId = json['googlePlaceId'];
    formattedAddress = json['formattedAddress'];
    photos = json['photos'].cast<String>();
    rating = json['rating']?.toDouble();
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['_id'] = sId;
    data['name'] = name;
    data['status'] = status;
    data['parkType'] = parkType;
    if (currentCheckins != null) {
      data['currentCheckins'] =
          currentCheckins!.map((v) => v.toJson()).toList();
    }
    data['googlePlaceId'] = googlePlaceId;
    data['formattedAddress'] = formattedAddress;
    data['photos'] = photos;
    data['rating'] = rating;
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
