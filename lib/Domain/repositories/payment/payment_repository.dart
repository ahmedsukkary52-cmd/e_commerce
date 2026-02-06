import '../../../api/model/request/payment/billing_data_request_dto.dart';
import '../../entities/payment/payment_result.dart';

abstract class PaymentRepository {
  Future<PaymentResult> createPaymentKey({
    required int amount,
    required BillingData billingData,
    required PaymentMethod paymentMethod,
  });
}
