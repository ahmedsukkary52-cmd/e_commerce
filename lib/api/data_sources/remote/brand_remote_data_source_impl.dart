import 'package:dio/dio.dart';
import 'package:e_commerce/Data/data_sources/remote/brand_remote_data_source.dart';
import 'package:e_commerce/Domain/entities/response/brand/brand_data.dart';
import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/mappers/brand/brand_mapper.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandRemoteDataSource)
class BrandRemoteDataSourceImpl implements BrandRemoteDataSource {
  ApiServices apiServices;

  BrandRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<List<Data>?> getAllBrands() async {
    try {
      var brandResponse = await apiServices.getAllBrands();
      return brandResponse.data
              ?.map((brandDto) => brandDto.toData())
              .toList() ??
          [];
    } on DioException catch (e) {}
  }
}
