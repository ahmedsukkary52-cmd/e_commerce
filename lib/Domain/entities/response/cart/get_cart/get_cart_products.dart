import 'package:e_commerce/Domain/entities/response/product/product_data.dart';

class GetCartProducts {
  final int? count;
  final String? id;
  final ProductData? product;
  final int? price;

  GetCartProducts({this.count, this.id, this.product, this.price});
}
