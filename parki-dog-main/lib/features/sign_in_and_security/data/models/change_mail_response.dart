class ChangeEmailResponse {
  final String? token;

  ChangeEmailResponse({required this.token});

  factory ChangeEmailResponse.fromJson(Map<String, dynamic> json) {
    return ChangeEmailResponse(
      token: json['token'],
    );
  }
}
