// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_favorite_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFavoriteResponseDto _$AddFavoriteResponseDtoFromJson(
  Map<String, dynamic> json,
) => AddFavoriteResponseDto(
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$AddFavoriteResponseDtoToJson(
  AddFavoriteResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
