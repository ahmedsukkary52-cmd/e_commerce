class AuthTokenRequest {
  final String apiKey;

  AuthTokenRequest({required this.apiKey});

  Map<String, dynamic> toJson() => {"api_key": apiKey};
}
