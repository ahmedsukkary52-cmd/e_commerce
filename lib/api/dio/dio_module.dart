import 'package:dio/dio.dart';
import 'package:e_commerce/api/route_api/api_end_point.dart';
import 'package:e_commerce/api/route_api/api_services.dart';
import 'package:e_commerce/api/dio/dio_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class GetItModule {

  @singleton
  @Named("appBaseOptions")
  BaseOptions provideBaseOptions() {
    return BaseOptions(
      baseUrl: ApiEndPoint.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
  }

  @singleton
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
  @Named("appDio")
  Dio provideDio(@Named("appBaseOptions") BaseOptions baseOptions,
      PrettyDioLogger prettyDioLogger,) {
    final dio = Dio(baseOptions);
    dio.interceptors.add(DioInterceptor());
    dio.interceptors.add(prettyDioLogger);
    return dio;
  }

  @singleton
  ApiServices provideApiServices(@Named("appDio") Dio dio,) => ApiServices(dio);
}
