class Reviews {
  String? author;
  int? rating;
  String? text;
  String? time;
  String? googlePlaceId;

  Reviews({this.author, this.rating, this.text, this.time, this.googlePlaceId});

  Reviews.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    rating = json['rating'];
    text = json['text'];
    time = json['time'];
    googlePlaceId = json['googlePlaceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author'] = author;
    data['rating'] = rating;
    data['text'] = text;
    data['time'] = time;
    data['googlePlaceId'] = googlePlaceId;
    return data;
  }
}
