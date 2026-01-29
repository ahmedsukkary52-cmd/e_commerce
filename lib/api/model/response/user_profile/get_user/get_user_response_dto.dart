import 'package:json_annotation/json_annotation.dart';
import '../add_user/user_profile_dto.dart';

part 'get_user_response_dto.g.dart';

@JsonSerializable()
class GetUserResponseDto {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "data")
  final List<UserProfileDto>? data;

  GetUserResponseDto({this.results, this.status, this.data});

  factory GetUserResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GetUserResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetUserResponseDtoToJson(this);
  }
}
