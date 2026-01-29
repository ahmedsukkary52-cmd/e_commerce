import 'package:e_commerce/Domain/entities/request/auth_request/login_request.dart';

import '../../model/request/auth_request/login_request_dto.dart';

extension LoginRequestMapper on LoginRequest {
  LoginRequestDto toLoginRequestDto() {
    return LoginRequestDto(email: email, password: password);
  }
}
