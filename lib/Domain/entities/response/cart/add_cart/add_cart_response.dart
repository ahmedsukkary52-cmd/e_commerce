import 'package:e_commerce/Domain/entities/response/cart/add_cart/add_cart_data.dart';

class AddCartResponse {
  final String? status;
  final String? message;
  final int? numOfCartItems;
  final String? cartId;
  final AddCartData? data;

  AddCartResponse({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });
}
