import 'package:dio/dio.dart';

import '../../core/Exceptions/exceptions_app.dart';

class DioInterceptor extends Interceptor {
  void onError(DioException err, ErrorInterceptorHandler handler) {
    ExceptionsApp exceptionsApp;
    final responseData = err.response?.data;
    String message = 'Some thing went wrong.';

    if (responseData is Map) {
      message =
          (responseData['errors']?['msg'] as String?) ??
          (responseData['message'] as String?) ??
          message;
    }
    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout) {
      exceptionsApp = NetworkError(errorMessage: 'No internet connection');
    } else if (err.response?.statusCode != null) {
      exceptionsApp = ServerError(
        errorMessage: message,
        statusCode: err.response?.statusCode,
      );
    } else {
      exceptionsApp = UnExpectedError(errorMessage: message);
    }
    handler.next(
      DioException(requestOptions: err.requestOptions, error: exceptionsApp),
    );
  }
}
