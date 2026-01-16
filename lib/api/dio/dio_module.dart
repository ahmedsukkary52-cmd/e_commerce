import 'package:dio/dio.dart';
import 'package:e_commerce/api/api_end_point.dart';
import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/dio/dio_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class GetItModule {
  @singleton
  @injectable
  BaseOptions provideBaseOptions() {
    return BaseOptions(
      baseUrl: ApiEndPoint.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
  }

  @singleton
  @injectable
  PrettyDioLogger providePrettyDioLogger() {
    return PrettyDioLogger(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    );
  }

  @singleton
  @injectable
  Dio provideDio(BaseOptions baseOptions, PrettyDioLogger prettyDioLogger) {
    var dio = Dio(baseOptions);
    dio.interceptors.add(DioInterceptor());
    dio.interceptors.add(prettyDioLogger);
    return dio;
  }

  @singleton
  @injectable
  ApiServices provideApiServices(Dio dio) => ApiServices(dio);
}
