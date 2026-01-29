import 'package:e_commerce/api/model/response/common/brand_data_dto.dart';
import 'package:e_commerce/api/model/response/common/category_dto.dart';
import 'package:e_commerce/api/model/response/common/product_subcategory_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_data_dto.g.dart';

@JsonSerializable()
class ProductDataDto {
  @JsonKey(name: "sold")
  final int? sold;
  @JsonKey(name: "images")
  final List<String>? images;
  @JsonKey(name: "subcategory")
  final List<SubcategoryDto>? subcategory;
  @JsonKey(name: "ratingsQuantity")
  final int? ratingsQuantity;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "imageCover")
  final String? imageCover;
  @JsonKey(name: "category")
  final CategoryDto? category;
  @JsonKey(name: "brand")
  final DataDto? brand;
  @JsonKey(name: "ratingsAverage")
  final double? ratingsAverage;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "id")
  final String? id;

  ProductDataDto({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  factory ProductDataDto.fromJson(Map<String, dynamic> json) {
    return _$ProductDataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductDataDtoToJson(this);
  }
}
