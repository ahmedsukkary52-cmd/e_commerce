import 'package:e_commerce/Data/data_sources/remote/auth_remote_data_source.dart';
import 'package:e_commerce/Domain/entities/request/auth_request/login_request.dart';
import 'package:e_commerce/Domain/entities/response/auth/auth_response.dart';
import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/mappers/auth/auth_response_mapper.dart';
import 'package:e_commerce/api/mappers/auth/login_request_mapper.dart';
import 'package:e_commerce/api/mappers/auth/register_request_mapper.dart';
import 'package:injectable/injectable.dart';

import '../../../Domain/entities/request/auth_request/register_request.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiServices apiServices;

  AuthRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) async {
    var authResponse = await apiServices.login(
      loginRequest.toLoginRequestDto(),
    );
    return authResponse.toAuthResponse();
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) async {
    var authResponse = await apiServices.register(
      registerRequest.toRegisterRequestDto(),
    );
    return authResponse.toAuthResponse();
  }
}
