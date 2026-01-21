import 'package:e_commerce/Domain/entities/response/category/category.dart';

abstract class CategoriesRemoteDataSource {
  Future<List<Category>?> getAllCategories();
}
