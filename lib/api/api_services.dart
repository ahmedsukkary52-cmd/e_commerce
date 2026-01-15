import 'package:dio/dio.dart';
import 'package:e_commerce/api/api_end_point.dart';
import 'package:e_commerce/api/model/request/login_request_dto.dart';
import 'package:e_commerce/api/model/request/register_request_dto.dart';
import 'package:e_commerce/api/model/response/auth_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiEndPoint.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(ApiEndPoint.login)
  Future<AuthResponseDto> login(@Body() LoginRequestDto loginRequest);

  @POST(ApiEndPoint.register)
  Future<AuthResponseDto> register(@Body() RegisterRequestDto registerRequest);
}
