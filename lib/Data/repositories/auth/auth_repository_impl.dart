import 'package:e_commerce/Data/data_sources/remote/auth_remote_data_source.dart';
import 'package:e_commerce/Domain/entities/request/auth_request/login_request.dart';
import 'package:e_commerce/Domain/entities/request/auth_request/register_request.dart';
import 'package:e_commerce/Domain/entities/response/auth/auth_response.dart';
import 'package:e_commerce/Domain/repositories/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) {
    return authRemoteDataSource.login(loginRequest);
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) {
    return authRemoteDataSource.register(registerRequest);
  }
}
