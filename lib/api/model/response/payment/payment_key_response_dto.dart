class PaymentKeyResponse {
  final String token;

  PaymentKeyResponse({required this.token});

  factory PaymentKeyResponse.fromJson(Map<String, dynamic> json) {
    return PaymentKeyResponse(token: json['token']);
  }
}
