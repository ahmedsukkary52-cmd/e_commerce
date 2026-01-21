import 'package:e_commerce/Domain/entities/request/login_request.dart';
import 'package:e_commerce/Domain/entities/request/register_request.dart';
import 'package:e_commerce/Domain/entities/response/auth/auth_response.dart';

abstract class AuthRepository {
  Future<AuthResponse> login(LoginRequest loginRequest);

  Future<AuthResponse> register(RegisterRequest registerRequest);
}
