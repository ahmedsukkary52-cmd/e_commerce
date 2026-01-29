// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_cart_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCartProductDto _$AddCartProductDtoFromJson(Map<String, dynamic> json) =>
    AddCartProductDto(
      count: (json['count'] as num?)?.toInt(),
      id: json['_id'] as String?,
      product: json['product'] as String?,
      price: (json['price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddCartProductDtoToJson(AddCartProductDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      '_id': instance.id,
      'product': instance.product,
      'price': instance.price,
    };
