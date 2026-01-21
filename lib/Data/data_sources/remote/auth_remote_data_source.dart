import '../../../Domain/entities/request/login_request.dart';
import '../../../Domain/entities/request/register_request.dart';
import '../../../Domain/entities/response/auth/auth_response.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> login(LoginRequest loginRequest);

  Future<AuthResponse> register(RegisterRequest registerRequest);
}
