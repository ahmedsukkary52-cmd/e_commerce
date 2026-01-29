import '../../../Domain/entities/response/category/category.dart';
import '../../model/response/common/category_dto.dart';

extension CategoryMapper on CategoryDto {
  Category toCategory() {
    return Category(
      updatedAt: updatedAt,
      slug: slug,
      image: image,
      id: id,
      createdAt: createdAt,
      name: name,
    );
  }
}
