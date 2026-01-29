import 'package:json_annotation/json_annotation.dart';

part 'user_profile_request_dto.g.dart';

@JsonSerializable()
class UserProfileRequestDto {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "details")
  final String? details;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "city")
  final String? city;

  UserProfileRequestDto({this.name, this.details, this.phone, this.city});

  factory UserProfileRequestDto.fromJson(Map<String, dynamic> json) {
    return _$UserProfileRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserProfileRequestDtoToJson(this);
  }
}
