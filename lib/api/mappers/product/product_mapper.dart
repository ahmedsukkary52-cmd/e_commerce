import 'package:e_commerce/Domain/entities/response/product/product_data.dart';
import 'package:e_commerce/api/mappers/brand/brand_mapper.dart';
import 'package:e_commerce/api/mappers/category/category_mapper.dart';
import 'package:e_commerce/api/mappers/product/sub_category_mapper.dart';
import 'package:e_commerce/api/model/response/product/product_data_dto.dart';

extension ProductMapper on ProductDataDto {
  ProductData toProductData() {
    return ProductData(
      updatedAt: updatedAt,
      slug: slug,
      id: id,
      createdAt: createdAt,
      brand: brand?.toData(),
      category: category?.toCategory(),
      description: description,
      imageCover: imageCover,
      images: images,
      price: price,
      quantity: quantity,
      ratingsAverage: ratingsAverage,
      ratingsQuantity: ratingsQuantity,
      sold: sold,
      subcategory:
          subcategory?.map((subDto) => subDto.toSubCategory()).toList() ?? [],
      title: title,
    );
  }
}
