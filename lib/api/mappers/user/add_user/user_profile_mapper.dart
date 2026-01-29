import 'package:e_commerce/Domain/entities/request/user_request/user_profile_request.dart';
import 'package:e_commerce/api/model/request/user_request/user_profile_request_dto.dart';

extension UserProfileMapper on UserProfileRequest {
  UserProfileRequestDto toUser() {
    return UserProfileRequestDto(
      name: name,
      phone: phone,
      city: city,
      details: details,
    );
  }
}
