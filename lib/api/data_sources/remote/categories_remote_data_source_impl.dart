import 'package:dio/dio.dart';
import 'package:e_commerce/Data/data_sources/remote/categories_remote_data_source.dart';
import 'package:e_commerce/Domain/entities/response/category/category.dart';
import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/mappers/category/category_mapper.dart';
import 'package:e_commerce/core/Exceptions/exceptions_app.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRemoteDataSource)
class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  ApiServices apiServices;

  CategoriesRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<List<Category>?> getAllCategories() async {
    try {
      var categoryResponse = await apiServices.getAllCategories();
      return categoryResponse.data
              ?.map((categoryDto) => categoryDto.toCategory())
              .toList() ??
          [];
    } on DioException catch (e) {
      String message = (e.error as ExceptionsApp).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}
