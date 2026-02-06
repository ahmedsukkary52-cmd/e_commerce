import 'package:dio/dio.dart';
import 'package:e_commerce/api/payment_api/payment_api_end_point.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../model/request/payment/auth_token_request_dto.dart';
import '../model/request/payment/kiosk_payment_request_dto.dart';
import '../model/request/payment/order_request_dto.dart';
import '../model/request/payment/payment_key_request_dto.dart';
import '../model/response/payment/auth_token_response_dto.dart';
import '../model/response/payment/kiosk_payment_response_dto.dart';
import '../model/response/payment/order_response_dto.dart';
import '../model/response/payment/payment_key_response_dto.dart';

part 'payment_api_services.g.dart';

@RestApi(baseUrl: PaymentApiEndPoint.baseUrl)
abstract class PaymentApiServices {
  factory PaymentApiServices(Dio dio, {String? baseUrl}) = _PaymentApiServices;

  @POST(PaymentApiEndPoint.authToken)
  Future<AuthTokenResponse> getAuthToken(
    @Body() AuthTokenRequest authTokenRequest,
  );

  @POST(PaymentApiEndPoint.order)
  Future<OrderResponse> createOrder(@Body() OrderRequest orderRequest);

  @POST(PaymentApiEndPoint.paymentKey)
  Future<PaymentKeyResponse> getPaymentKey(
    @Body() PaymentKeyRequest paymentKeyRequest,
  );

  @POST(PaymentApiEndPoint.kiosk)
  Future<KioskPayResponse> payWithKiosk(@Body() KioskPayRequest request);
}
