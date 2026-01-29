import 'package:e_commerce/Domain/entities/response/user_profile/add_user/user_profile_response.dart';
import 'package:e_commerce/api/mappers/user/add_user/user_data_mapper.dart';
import 'package:e_commerce/api/model/response/user_profile/add_user/user_profile_response_dto.dart';

extension UserProfileRequestMapper on UserProfileResponseDto {
  UserProfileResponse toUser() {
    return UserProfileResponse(
      status: status,
      data: data?.map((userDto) => userDto.toUser()).toList(),
      message: message,
    );
  }
}
