class KioskPayRequest {
  final String paymentToken;

  KioskPayRequest({required this.paymentToken});

  Map<String, dynamic> toJson() => {
    "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
    "payment_token": paymentToken,
  };
}
