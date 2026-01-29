import 'package:e_commerce/Domain/entities/response/cart/add_cart/add_cart_response.dart';
import 'package:e_commerce/Domain/entities/response/cart/get_cart/get_cart_response.dart';
import 'package:e_commerce/Domain/repositories/cart/add_cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteItemsInCartUseCase {
  CartRepository cartRepository;

  DeleteItemsInCartUseCase({required this.cartRepository});

  Future<GetCartResponse> invoke(String productId) {
    return cartRepository.deleteCartItem(productId);
  }
}
