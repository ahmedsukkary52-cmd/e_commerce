import 'package:e_commerce/Domain/entities/response/category/category.dart';

abstract class CategoriesRepository {
  Future<List<Category>?> getAllCategories();
}
