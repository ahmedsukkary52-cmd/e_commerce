import 'package:e_commerce/api/model/response/cart/add_cart/add_cart_product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_cart_data_dto.g.dart';

@JsonSerializable()
class AddCartDataDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "cartOwner")
  final String? cartOwner;
  @JsonKey(name: "products")
  final List<AddCartProductDto>? products;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;
  @JsonKey(name: "totalCartPrice")
  final int? totalCartPrice;

  AddCartDataDto({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  factory AddCartDataDto.fromJson(Map<String, dynamic> json) {
    return _$AddCartDataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddCartDataDtoToJson(this);
  }
}
