import 'package:e_commerce/api/model/request/auth_request/register_request_dto.dart';

import '../../../Domain/entities/request/auth_request/register_request.dart';

extension RegisterRequestMapper on RegisterRequest {
  RegisterRequestDto toRegisterRequestDto() {
    return RegisterRequestDto(
      name: name,
      email: email,
      password: password,
      phone: phone,
      rePassword: rePassword,
    );
  }
}
