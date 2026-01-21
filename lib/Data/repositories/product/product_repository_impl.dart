import 'package:e_commerce/Data/data_sources/remote/product_remote_data_source.dart';
import 'package:e_commerce/Domain/entities/response/product/product_data.dart';
import 'package:e_commerce/Domain/repositories/product/product_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ProductData>?> getAllProducts() {
    return remoteDataSource.getAllProduct();
  }
}
