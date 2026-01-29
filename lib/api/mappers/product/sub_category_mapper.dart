import 'package:e_commerce/Domain/entities/response/product/product_subcategory.dart';
import 'package:e_commerce/api/model/response/common/product_subcategory_dto.dart';

extension SubCategoryMapper on SubcategoryDto {
  Subcategory toSubCategory() {
    return Subcategory(category: category, id: id, slug: slug, name: name);
  }
}
