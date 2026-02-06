import 'package:dio/dio.dart';
import 'package:e_commerce/core/Exceptions/payment_exceptions.dart';

class PaymentInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final data = err.response?.data;
    late PaymentExceptions exception;

    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.connectionError) {
      exception = PaymentNetworkError();
    } else if (data is Map && data['detail'] != null) {
      exception = InvalidPaymentData(data['detail']);
    } else {
      exception = InvalidPaymentData("Payment failed");
    }

    handler.next(
      DioException(requestOptions: err.requestOptions, error: exception),
    );
  }
}
