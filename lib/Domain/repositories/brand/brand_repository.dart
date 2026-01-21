import 'package:e_commerce/Domain/entities/response/brand/brand_data.dart';

abstract class BrandRepository {
  Future<List<Data>?> getAllBrands();
}
