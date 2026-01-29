import 'package:e_commerce/Domain/entities/response/brand/brand_data.dart';
import 'package:e_commerce/Domain/entities/response/category/category.dart';
import 'package:e_commerce/Domain/entities/response/product/product_subcategory.dart';

class ProductData {
  final int? sold;
  final List<String>? images;
  final List<Subcategory>? subcategory;
  final int? ratingsQuantity;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final int? price;
  final String? imageCover;
  final Category? category;
  final Data? brand;
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
