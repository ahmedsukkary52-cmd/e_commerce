import 'package:e_commerce/Domain/entities/response/cart/add_cart/add_cart_product.dart';

class AddCartData {
  final String? id;
  final String? cartOwner;
  final List<AddCartProduct>? products;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final int? totalCartPrice;

  AddCartData({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });
}
