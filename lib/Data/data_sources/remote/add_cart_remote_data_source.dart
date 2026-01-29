import 'package:e_commerce/Domain/entities/response/cart/add_cart/add_cart_response.dart';

import '../../../Domain/entities/response/cart/get_cart/get_cart_response.dart';

abstract class AddCartRemoteDataSource {
  Future<AddCartResponse> addToCart({required String productId});

  Future<GetCartResponse> getItemsInCart();

  Future<GetCartResponse> deleteCartItem(String productId);

  Future<GetCartResponse> updateCountInCart(String productId, int count);
}
