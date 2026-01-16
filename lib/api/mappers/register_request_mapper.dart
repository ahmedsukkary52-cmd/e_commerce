import 'package:e_commerce/Domain/entities/request/register_request.dart';
import 'package:e_commerce/api/model/request/register_request_dto.dart';

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
