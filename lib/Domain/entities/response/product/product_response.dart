import '../../../../api/model/response/product/product_data_dto.dart';
import '../../../../api/model/response/product/product_meta_data_dto.dart';

class ProductResponse {
  final int? results;
  final ProductMetadataDto? metadata;
  final List<ProductDataDto>? data;

  ProductResponse({this.results, this.metadata, this.data});
}
