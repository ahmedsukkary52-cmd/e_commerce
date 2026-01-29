import 'package:e_commerce/Domain/entities/response/cart/add_cart/add_cart_response.dart';
import 'package:e_commerce/Domain/entities/response/cart/get_cart/get_cart_response.dart';

abstract class CartRepository {
  Future<AddCartResponse> addToCart(String productId);

  Future<GetCartResponse> deleteCartItem(String productId);

  Future<GetCartResponse> updateCountInCart(String productId, int count);

  Future<GetCartResponse> getItemsInCart();
}
