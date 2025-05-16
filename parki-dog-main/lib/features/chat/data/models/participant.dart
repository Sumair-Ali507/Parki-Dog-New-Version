class Participant {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? id;

  Participant({this.sId, this.firstName, this.lastName, this.email, this.id});

  Participant.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['id'] = id;
    return data;
  }

  Participant copyWith({
    String? sId,
    String? firstName,
    String? lastName,
    String? email,
    String? id,
  }) {
    return Participant(
      sId: sId ?? this.sId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      id: id ?? this.id,
    );
  }
}