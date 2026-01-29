import 'package:json_annotation/json_annotation.dart';

part 'add_cart_product_dto.g.dart';

@JsonSerializable()
class AddCartProductDto {
  @JsonKey(name: "count")
  final int? count;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "product")
  final String? product;
  @JsonKey(name: "price")
  final int? price;

  AddCartProductDto({this.count, this.id, this.product, this.price});

  factory AddCartProductDto.fromJson(Map<String, dynamic> json) {
    return _$AddCartProductDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddCartProductDtoToJson(this);
  }
}
