import 'package:json_annotation/json_annotation.dart';

part 'user_profile_dto.g.dart';

@JsonSerializable()
class UserProfileDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "details")
  final String? details;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "city")
  final String? city;

  UserProfileDto({this.id, this.name, this.details, this.phone, this.city});

  factory UserProfileDto.fromJson(Map<String, dynamic> json) {
    return _$UserProfileDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserProfileDtoToJson(this);
  }
}
