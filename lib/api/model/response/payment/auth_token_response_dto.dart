class AuthTokenResponse {
  final String token;

  AuthTokenResponse({required this.token});

  factory AuthTokenResponse.fromJson(Map<String, dynamic> json) {
    return AuthTokenResponse(token: json['token']);
  }
}
