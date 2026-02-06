class OrderRequest {
  final String authToken;
  final int amountCents;
  final String currency;

  OrderRequest({
    required this.authToken,
    required this.amountCents,
    this.currency = "EGP",
  });

  Map<String, dynamic> toJson() => {
    "auth_token": authToken,
    "delivery_needed": false,
    "amount_cents": amountCents.toString(),
    "currency": currency,
    "items": [],
  };
}
