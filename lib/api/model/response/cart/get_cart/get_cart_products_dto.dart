import 'package:e_commerce/api/model/response/product/product_data_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_cart_products_dto.g.dart';

@JsonSerializable()
class GetCartProductsDto {
  @JsonKey(name: "count")
  final int? count;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "product")
  final ProductDataDto? product;
  @JsonKey(name: "price")
  final int? price;

  GetCartProductsDto({this.count, this.id, this.product, this.price});

  factory GetCartProductsDto.fromJson(Map<String, dynamic> json) {
    return _$GetCartProductsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetCartProductsDtoToJson(this);
  }
}
