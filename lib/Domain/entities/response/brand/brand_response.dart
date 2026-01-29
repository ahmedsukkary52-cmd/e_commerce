import 'package:e_commerce/Domain/entities/response/brand/brand_data.dart';
import 'package:e_commerce/Domain/entities/response/brand/brand_meta_data.dart';

class BrandResponse {
  final int? results;
  final Metadata? metadata;
  final List<Data>? data;

  BrandResponse({this.results, this.metadata, this.data});
}
