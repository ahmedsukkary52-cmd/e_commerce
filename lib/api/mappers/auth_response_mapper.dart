import 'package:e_commerce/Domain/entities/response/auth_response.dart';
import 'package:e_commerce/api/mappers/user_mapper.dart';
import 'package:e_commerce/api/model/response/auth_response_dto.dart';
import 'package:e_commerce/core/Exceptions/exceptions_app.dart';

extension AuthResponseMapper on AuthResponseDto {
  AuthResponse toAuthResponse() {
    if (token != null || token!.isNotEmpty || user != null) {
      return AuthResponse(message: message, token: token, user: user?.toUser());
    } else {
      throw ServerError(errorMessage: 'Failed Authentication');
    }
  }
}
