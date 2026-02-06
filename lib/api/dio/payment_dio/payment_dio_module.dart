import 'package:dio/dio.dart';
import 'package:e_commerce/api/dio/payment_dio/payment_dio_interceptor.dart';
import 'package:e_commerce/api/payment_api/payment_api_end_point.dart';
import 'package:e_commerce/api/payment_api/payment_api_services.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class PaymentModule {
  @singleton
  @Named("paymentBaseOptions")
  BaseOptions providePaymentBaseOptions() {
    return BaseOptions(
      baseUrl: PaymentApiEndPoint.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
      headers: {"Content-Type": "application/json"},
    );
  }

  @singleton
  @Named("paymentDio")
  Dio providePaymentDio(
    @Named("paymentBaseOptions") BaseOptions baseOptions,
    PrettyDioLogger prettyDioLogger,
  ) {
    final dio = Dio(baseOptions);
    dio.interceptors.add(prettyDioLogger);
    dio.interceptors.add(PaymentInterceptor());
    return dio;
  }

  @singleton
  PaymentApiServices providePaymentApiServices(@Named("paymentDio") Dio dio) {
    return PaymentApiServices(dio);
  }
}
