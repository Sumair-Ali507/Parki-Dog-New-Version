class ChangePasswordResponse {
  final String? token;

  ChangePasswordResponse({required this.token});

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) {
    return ChangePasswordResponse(
      token: json['token'],
    );
  }
}
