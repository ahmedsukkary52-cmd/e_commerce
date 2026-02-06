import 'billing_data_request_dto.dart';

class PaymentKeyRequest {
  final String authToken;
  final int amountCents;
  final int orderId;
  final int integrationId;
  final BillingData billingData;

  PaymentKeyRequest({
    required this.authToken,
    required this.amountCents,
    required this.orderId,
    required this.integrationId,
    required this.billingData,
  });

  Map<String, dynamic> toJson() => {
    "auth_token": authToken,
    "amount_cents": amountCents.toString(),
    "expiration": 3600,
    "order_id": orderId,
    "currency": "EGP",
    "integration_id": integrationId,
    "billing_data": billingData.toJson(),
  };
}
