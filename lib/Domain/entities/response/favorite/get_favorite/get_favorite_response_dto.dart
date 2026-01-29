import '../../product/product_data.dart';

class GetFavoriteResponse {
  final String? status;
  final int? count;
  final List<ProductData>? data;

  GetFavoriteResponse({this.status, this.count, this.data});
}
