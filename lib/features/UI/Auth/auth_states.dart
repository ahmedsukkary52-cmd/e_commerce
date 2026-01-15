import 'package:e_commerce/Domain/entities/response/auth_response.dart';

sealed class AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthErrorState extends AuthStates {
  String errorMessage;

  AuthErrorState({required this.errorMessage});
}

class AuthSuccessState extends AuthStates {
  AuthResponse authResponse;

  AuthSuccessState({required this.authResponse});
}
