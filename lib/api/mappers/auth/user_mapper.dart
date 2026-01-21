import 'package:e_commerce/Domain/entities/response/common/user.dart';
import 'package:e_commerce/api/model/response/auth/user_dto.dart';

extension UserMapper on UserDto {
  User toUser() {
    return User(email: email, name: name, role: role);
  }
}
