class AppUser {
  String? firstName;
  String? lastName;
  String? email;
  String? id;

  AppUser({this.firstName, this.lastName, this.email, this.id});

  AppUser.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['id'] = id;
    return data;
  }
}
