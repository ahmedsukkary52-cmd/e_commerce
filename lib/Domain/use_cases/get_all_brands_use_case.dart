import 'package:e_commerce/Domain/entities/response/brand/brand_data.dart';
import 'package:e_commerce/Domain/entities/response/brand/brand_response.dart';
import 'package:e_commerce/Domain/repositories/brand/brand_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllBrandsUseCase {
  BrandRepository brandRepository;

  GetAllBrandsUseCase({required this.brandRepository});

  Future<List<Data>?> invoke() {
    return brandRepository.getAllBrands();
  }
}
