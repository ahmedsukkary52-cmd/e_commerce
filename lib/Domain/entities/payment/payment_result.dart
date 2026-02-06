enum PaymentMethod { card, kiosk }

sealed class PaymentResult {}

class CardPaymentResult extends PaymentResult {
  final String paymentKey;

  CardPaymentResult({required this.paymentKey});
}

class KioskPaymentResult extends PaymentResult {
  final String referenceCode;

  KioskPaymentResult({required this.referenceCode});
}
