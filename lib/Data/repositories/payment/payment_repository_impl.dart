import 'package:injectable/injectable.dart';

import '../../../Domain/entities/payment/payment_result.dart';
import '../../../Domain/repositories/payment/payment_repository.dart';
import '../../../api/model/request/payment/auth_token_request_dto.dart';
import '../../../api/model/request/payment/kiosk_payment_request_dto.dart';
import '../../../api/model/request/payment/order_request_dto.dart';
import '../../../api/model/request/payment/payment_key_request_dto.dart';
import '../../../api/model/request/payment/billing_data_request_dto.dart';
import '../../../api/payment_api/payment_api_services.dart';

@Injectable(as: PaymentRepository)
class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentApiServices apiService;

  PaymentRepositoryImpl(this.apiService);

  final String apiKey =
      "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TVRFeU5qZ3lOU3dpYm1GdFpTSTZJbWx1YVhScFlXd2lmUS5JSVlYTFB0R2VPanZWa2RkdUJkakFiMEhFR3YtT1RhdWpqakFIbk0zbzh3NmNhX2lITjM0VGhwZFNxLUR2ZHhLR3ZVOW5hQjNrYmlEZlgxTmt1TkxuUQ==";

  int _getIntegrationId(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.card:
        return 5488515;
      case PaymentMethod.kiosk:
        return 5488530;
    }
  }

  @override
  Future<PaymentResult> createPaymentKey({
    required int amount,
    required BillingData billingData,
    required PaymentMethod paymentMethod,
  }) async {
    final authResponse = await apiService.getAuthToken(
      AuthTokenRequest(apiKey: apiKey),
    );

    final orderResponse = await apiService.createOrder(
      OrderRequest(authToken: authResponse.token, amountCents: amount),
    );

    final paymentKeyResponse = await apiService.getPaymentKey(
      PaymentKeyRequest(
        authToken: authResponse.token,
        orderId: orderResponse.id,
        amountCents: amount,
        integrationId: _getIntegrationId(paymentMethod),
        billingData: billingData,
      ),
    );

    if (paymentMethod == PaymentMethod.card) {
      return CardPaymentResult(paymentKey: paymentKeyResponse.token);
    } else {
      final kioskResponse = await apiService.payWithKiosk(
        KioskPayRequest(paymentToken: paymentKeyResponse.token),
      );

      return KioskPaymentResult(referenceCode: kioskResponse.billReference);
    }
  }
}
