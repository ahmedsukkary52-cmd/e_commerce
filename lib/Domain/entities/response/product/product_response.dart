import 'package:e_commerce/Domain/entities/response/product/product_data.dart';
import 'package:e_commerce/Domain/entities/response/product/product_meta_data.dart';

class ProductResponse {
  final int? results;
  final ProductMetadata? metadata;
  final List<ProductData>? data;

  ProductResponse({this.results, this.metadata, this.data});
}
