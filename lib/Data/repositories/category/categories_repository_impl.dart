import 'package:e_commerce/Data/data_sources/remote/categories_remote_data_source.dart';
import 'package:e_commerce/Domain/entities/response/category/category.dart';
import 'package:e_commerce/Domain/repositories/categories/categories_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  CategoriesRemoteDataSource remoteDataSource;

  CategoriesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Category>?> getAllCategories() {
    return remoteDataSource.getAllCategories();
  }
}
