import 'package:e_commerce/Domain/entities/response/brand/brand_data.dart';

abstract class BrandRemoteDataSource {
  Future<List<Data>?> getAllBrands();
}
