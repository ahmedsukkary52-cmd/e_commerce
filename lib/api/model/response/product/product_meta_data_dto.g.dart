// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_meta_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductMetadataDto _$ProductMetadataDtoFromJson(Map<String, dynamic> json) =>
    ProductMetadataDto(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      numberOfPages: (json['numberOfPages'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      nextPage: (json['nextPage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductMetadataDtoToJson(ProductMetadataDto instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'numberOfPages': instance.numberOfPages,
      'limit': instance.limit,
      'nextPage': instance.nextPage,
    };
