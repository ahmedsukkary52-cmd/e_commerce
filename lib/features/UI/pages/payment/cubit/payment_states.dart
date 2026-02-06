abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentCardSuccess extends PaymentState {
  final String paymentKey;

  PaymentCardSuccess(this.paymentKey);
}

class PaymentKioskSuccess extends PaymentState {
  final String referenceCode;

  PaymentKioskSuccess(this.referenceCode);
}

class PaymentError extends PaymentState {
  final String message;

  PaymentError(this.message);
}
