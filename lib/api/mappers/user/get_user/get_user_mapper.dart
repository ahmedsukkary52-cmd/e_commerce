import 'package:e_commerce/Domain/entities/response/user_profile/get_user/get_user_response.dart';
import 'package:e_commerce/api/mappers/user/add_user/user_data_mapper.dart';
import 'package:e_commerce/api/model/response/user_profile/get_user/get_user_response_dto.dart';

extension GetUserMapper on GetUserResponseDto {
  GetUserResponse toUser() {
    return GetUserResponse(
      data: data?.map((userDto) => userDto.toUser()).toList(),
      status: status,
      results: results,
    );
  }
}
