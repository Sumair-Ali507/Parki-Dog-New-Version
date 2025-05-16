import 'package:parki_dog/features/dog_owner/data/models/dog_owner.dart';
import 'package:parki_dog/features/dog_owner/data/models/unsociability.dart';

class DogsData {
  Unsociability? unsociability;
  String? sId;
  DogOwner? owner;
  String? name;
  String? breed;
  int? age;
  String? gender;
  int? weight;
  String? createdAt;
  String? updatedAt;

  DogsData(
      {this.unsociability,
      this.sId,
      this.owner,
      this.name,
      this.breed,
      this.age,
      this.gender,
      this.weight,
      this.createdAt,
      this.updatedAt});

  DogsData.fromJson(Map<String, dynamic> json) {
    unsociability = json['unsociability'] != null
        ? Unsociability.fromJson(json['unsociability'])
        : null;
    sId = json['_id'];
    owner = json['owner'] != null ? DogOwner.fromJson(json['owner']) : null;
    name = json['name'];
    breed = json['breed'];
    age = json['age'];
    gender = json['gender'];
    weight = json['weight'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (unsociability != null) {
      data['unsociability'] = unsociability!.toJson();
    }
    data['_id'] = sId;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    data['name'] = name;
    data['breed'] = breed;
    data['age'] = age;
    data['gender'] = gender;
    data['weight'] = weight;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
