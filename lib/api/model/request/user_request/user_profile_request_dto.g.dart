// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileRequestDto _$UserProfileRequestDtoFromJson(
  Map<String, dynamic> json,
) => UserProfileRequestDto(
  name: json['name'] as String?,
  details: json['details'] as String?,
  phone: json['phone'] as String?,
  city: json['city'] as String?,
);

Map<String, dynamic> _$UserProfileRequestDtoToJson(
  UserProfileRequestDto instance,
) => <String, dynamic>{
  'name': instance.name,
  'details': instance.details,
  'phone': instance.phone,
  'city': instance.city,
};
