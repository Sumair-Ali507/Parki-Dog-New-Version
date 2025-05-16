class DogOwnerInfoResponse {
  final String info;
  DogOwnerInfoResponse({
    required this.info,
  });

  factory DogOwnerInfoResponse.fromJson(Map<String, dynamic> json) {
    return DogOwnerInfoResponse(
      info: json['info'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['info'] = info;
    return data;
  }
}
