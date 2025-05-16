class SignupRequestBody {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? passwordConfirm;
  String? phone;
  String? country;
  LocationRequestBody? location;
  List<OwnedDogsRequestBody>? ownedDogs;

  SignupRequestBody(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.passwordConfirm,
      this.phone,
      this.country,
      this.location,
      this.ownedDogs});

  SignupRequestBody.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    passwordConfirm = json['passwordConfirm'];
    phone = json['phone'];
    country = json['country'];
    location = json['location'] != null
        ? LocationRequestBody.fromJson(json['location'])
        : null;
    if (json['ownedDogs'] != null) {
      ownedDogs = <OwnedDogsRequestBody>[];
      json['ownedDogs'].forEach((v) {
        ownedDogs!.add(OwnedDogsRequestBody.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['passwordConfirm'] = passwordConfirm;
    data['phone'] = phone;
    data['country'] = country;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (ownedDogs != null) {
      data['ownedDogs'] = ownedDogs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LocationRequestBody {
  List<double>? coordinates;

  LocationRequestBody({this.coordinates});

  LocationRequestBody.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coordinates'] = coordinates;
    return data;
  }
}

class OwnedDogsRequestBody {
  String? name;
  String? breed;
  int? age;
  String? gender;
  double? weight;
  UnsociabilityRequestBody? unsociability;

  OwnedDogsRequestBody(
      {this.name,
      this.breed,
      this.age,
      this.gender,
      this.weight,
      this.unsociability});

  OwnedDogsRequestBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    breed = json['breed'];
    age = json['age'];
    gender = json['gender'];
    weight = json['weight'];
    unsociability = json['unsociability'] != null
        ? UnsociabilityRequestBody.fromJson(json['unsociability'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['breed'] = breed;
    data['age'] = age;
    data['gender'] = gender;
    data['weight'] = weight;
    if (unsociability != null) {
      data['unsociability'] = unsociability!.toJson();
    }
    return data;
  }
}

class UnsociabilityRequestBody {
  List<String>? breeds;
  List<String>? genders;
  double? minWeight;

  UnsociabilityRequestBody({this.breeds, this.genders, this.minWeight});

  UnsociabilityRequestBody.fromJson(Map<String, dynamic> json) {
    breeds = json['breeds'].cast<String>();
    genders = json['genders'].cast<String>();
    minWeight = json['minWeight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (breeds != null) data['breeds'] = breeds;
    if (genders != null) data['genders'] = genders;
    if (minWeight != null) data['minWeight'] = minWeight;
    return data;
  }

  bool hasNonNullValues() {
    return breeds != null || genders != null || minWeight != null;
  }
}
