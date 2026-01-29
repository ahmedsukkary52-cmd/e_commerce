import 'package:e_commerce/Domain/entities/response/product/product_data.dart';
import 'package:e_commerce/Domain/repositories/product/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsUseCase {
  ProductRepository productRepository;

  GetAllProductsUseCase({required this.productRepository});

  Future<List<ProductData>?> invoke() {
    return productRepository.getAllProducts();
  }
}
