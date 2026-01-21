import 'package:e_commerce/api/model/response/brand/brand_data_dto.dart';
import 'package:e_commerce/api/model/response/category/category_dto.dart';
import 'package:e_commerce/api/model/response/product/product_subcategory_dto.dart';

class ProductData {
  final int? sold;
  final List<String>? images;
  final List<SubcategoryDto>? subcategory;
  final int? ratingsQuantity;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final int? price;
  final String? imageCover;
  final CategoryDto? category;
  final DataDto? brand;
  final double? ratingsAverage;
  final String? createdAt;
  final String? updatedAt;
  final String? id;

  ProductData({
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
}
