import 'package:e_commerce/Domain/entities/response/category/category.dart';
import 'package:e_commerce/Domain/entities/response/common/metadata.dart';

class CategoryResponse {
  final int? results;
  final Metadata? metadata;
  final List<Category>? data;

  CategoryResponse({this.results, this.metadata, this.data});
}
