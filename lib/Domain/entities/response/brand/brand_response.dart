import 'package:e_commerce/api/model/response/brand/brand_meta_data_dto.dart';
import '../../../../api/model/response/brand/brand_data_dto.dart';

class BrandResponse {
  final int? results;
  final MetadataDto? metadata;
  final List<DataDto>? data;

  BrandResponse({this.results, this.metadata, this.data});
}
