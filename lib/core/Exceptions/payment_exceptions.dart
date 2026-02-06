abstract class PaymentExceptions implements Exception {
  final String message;

  PaymentExceptions(this.message);
}

class PaymentNetworkError extends PaymentExceptions {
  PaymentNetworkError() : super("Payment connection failed");
}

class ExpiredPaymentToken extends PaymentExceptions {
  ExpiredPaymentToken() : super("Payment session expired");
}

class InvalidPaymentData extends PaymentExceptions {
  InvalidPaymentData(String msg) : super(msg);
}
