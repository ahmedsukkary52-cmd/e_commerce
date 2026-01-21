import 'package:dio/dio.dart';
import 'package:e_commerce/Data/data_sources/remote/product_remote_data_source.dart';
import 'package:e_commerce/Domain/entities/response/product/product_data.dart';
import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/mappers/product/product_mapper.dart';
import 'package:injectable/injectable.dart';

import '../../../core/Exceptions/exceptions_app.dart';

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  ApiServices apiServices;

  ProductRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<List<ProductData>?> getAllProduct() async {
    try {
      var productResponse = await apiServices.getAllProducts();
      return productResponse.data
              ?.map((productDto) => productDto.toProductData())
              .toList() ??
          [];
    } on DioException catch (e) {
      String message = (e.error as ExceptionsApp).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}
