import 'package:e_commerce/Domain/repositories/payment/payment_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../api/model/request/payment/billing_data_request_dto.dart';
import '../../entities/payment/payment_result.dart';

@injectable
class PaymentUseCase {
  PaymentRepository paymentRepository;

  PaymentUseCase({required this.paymentRepository});

  Future<PaymentResult> invoke({
    required int amount,
    required BillingData billingData,
    required PaymentMethod paymentMethod,
  }) {
    return paymentRepository.createPaymentKey(
      amount: amount,
      billingData: billingData,
      paymentMethod: paymentMethod,
    );
  }
}
