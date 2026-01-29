import 'package:e_commerce/Domain/entities/response/cart/get_cart/get_cart_products.dart';

class GetCartData {
  final String? id;
  final String? cartOwner;
  final List<GetCartProducts>? products;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final int? totalCartPrice;

  GetCartData({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });
}
