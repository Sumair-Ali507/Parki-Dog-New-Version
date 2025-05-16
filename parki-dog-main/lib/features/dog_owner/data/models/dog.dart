class Dog {
  String? name;
  String? breed;
  int? age;
  String? gender;

  Dog({this.name, this.breed, this.age, this.gender});

  Dog.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    breed = json['breed'];
    age = json['age'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['breed'] = breed;
    data['age'] = age;
    data['gender'] = gender;
    return data;
  }
}
