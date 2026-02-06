import 'package:e_commerce/features/UI/pages/payment/cubit/payment_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../Domain/entities/payment/payment_result.dart';
import '../../../../../Domain/use_cases/payment_use_case/payment_use_case.dart';
import '../../../../../api/model/request/payment/billing_data_request_dto.dart';
import '../../../../../core/Exceptions/exceptions_app.dart';

@injectable
class PaymentViewModel extends Cubit<PaymentState> {
  final PaymentUseCase paymentUseCase;

  PaymentViewModel(this.paymentUseCase) : super(PaymentInitial());

  static PaymentViewModel get(context) =>
      BlocProvider.of<PaymentViewModel>(context);

  Future<void> createPayment({
    required int amount,
    required BillingData billingData,
    required PaymentMethod paymentMethod,
  }) async {
    emit(PaymentLoading());

    try {
      final result = await paymentUseCase.invoke(
        amount: amount,
        billingData: billingData,
        paymentMethod: paymentMethod,
      );

      if (result is CardPaymentResult) {
        emit(PaymentCardSuccess(result.paymentKey));
      } else if (result is KioskPaymentResult) {
        emit(PaymentKioskSuccess(result.referenceCode));
      }
    } catch (e) {
      emit(
        PaymentError(e is ExceptionsApp ? e.errorMessage : 'Payment failed'),
      );
    }
  }
}
