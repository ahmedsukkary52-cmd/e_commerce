// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserResponseDto _$GetUserResponseDtoFromJson(Map<String, dynamic> json) =>
    GetUserResponseDto(
      results: (json['results'] as num?)?.toInt(),
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserProfileDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUserResponseDtoToJson(GetUserResponseDto instance) =>
    <String, dynamic>{
      'results': instance.results,
      'status': instance.status,
      'data': instance.data,
    };
