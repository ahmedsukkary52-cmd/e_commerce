// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cart_products_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCartProductsDto _$GetCartProductsDtoFromJson(Map<String, dynamic> json) =>
    GetCartProductsDto(
      count: (json['count'] as num?)?.toInt(),
      id: json['_id'] as String?,
      product: json['product'] == null
          ? null
          : ProductDataDto.fromJson(json['product'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetCartProductsDtoToJson(GetCartProductsDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      '_id': instance.id,
      'product': instance.product,
      'price': instance.price,
    };
