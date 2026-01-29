// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favorite_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFavoriteResponseDto _$GetFavoriteResponseDtoFromJson(
  Map<String, dynamic> json,
) => GetFavoriteResponseDto(
  status: json['status'] as String?,
  count: (json['count'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => ProductDataDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetFavoriteResponseDtoToJson(
  GetFavoriteResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'count': instance.count,
  'data': instance.data,
};
