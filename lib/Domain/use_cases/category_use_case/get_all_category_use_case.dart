import 'package:e_commerce/Domain/entities/response/category/category.dart';
import 'package:e_commerce/Domain/repositories/categories/categories_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCategoryUseCase {
  CategoriesRepository categoriesRepository;

  GetAllCategoryUseCase({required this.categoriesRepository});

  Future<List<Category>?> invoke() {
    return categoriesRepository.getAllCategories();
  }
}
