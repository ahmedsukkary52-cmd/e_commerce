import 'package:e_commerce/Domain/entities/response/product/product_data.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductData>?> getAllProduct();
}
