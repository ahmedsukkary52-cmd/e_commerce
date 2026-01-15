import 'package:e_commerce/Domain/entities/response/user.dart';
import 'package:e_commerce/api/model/response/user_dto.dart';

extension UserMapper on UserDto {
  User toUser() {
    return User(email: email, name: name, role: role);
  }
}
