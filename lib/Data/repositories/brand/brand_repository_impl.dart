import 'package:e_commerce/Data/data_sources/remote/brand_remote_data_source.dart';
import 'package:e_commerce/Domain/entities/response/brand/brand_data.dart';
import 'package:e_commerce/Domain/repositories/brand/brand_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandRepository)
class BrandRepositoryImpl implements BrandRepository {
  BrandRemoteDataSource remoteDataSource;

  BrandRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Data>?> getAllBrands() {
    return remoteDataSource.getAllBrands();
  }
}
