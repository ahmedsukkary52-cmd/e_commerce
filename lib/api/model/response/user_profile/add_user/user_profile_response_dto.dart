import 'package:e_commerce/api/model/response/user_profile/add_user/user_profile_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_profile_response_dto.g.dart';

@JsonSerializable()
class UserProfileResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<UserProfileDto>? data;

  UserProfileResponseDto({this.status, this.message, this.data});

  factory UserProfileResponseDto.fromJson(Map<String, dynamic> json) {
    return _$UserProfileResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserProfileResponseDtoToJson(this);
  }
}
