import 'package:e_commerce/Domain/entities/response/user.dart';

class AuthResponse {
  final String? message;
  final User? user;
  final String? token;

  AuthResponse({this.message, this.user, this.token});
}
