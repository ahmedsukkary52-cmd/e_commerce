import 'package:e_commerce/Domain/entities/response/user_profile/add_user/user_profile.dart';
import 'package:e_commerce/api/model/response/user_profile/add_user/user_profile_dto.dart';

extension UserDataMapper on UserProfileDto {
  UserProfile toUser() {
    return UserProfile(
      details: details,
      city: city,
      phone: phone,
      name: name,
      id: id,
    );
  }
}
