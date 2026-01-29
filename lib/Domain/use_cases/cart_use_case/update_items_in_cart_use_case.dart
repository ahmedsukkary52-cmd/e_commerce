import 'package:e_commerce/Domain/entities/response/cart/get_cart/get_cart_response.dart';
import 'package:e_commerce/Domain/repositories/cart/add_cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateItemsInCartUseCase {
  CartRepository cartRepository;

  UpdateItemsInCartUseCase({required this.cartRepository});

  Future<GetCartResponse> invoke(String productId, int count) {
    return cartRepository.updateCountInCart(productId, count);
  }
}
