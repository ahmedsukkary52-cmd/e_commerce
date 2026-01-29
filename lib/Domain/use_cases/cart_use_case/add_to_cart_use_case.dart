import 'package:e_commerce/Domain/entities/response/cart/add_cart/add_cart_response.dart';
import 'package:e_commerce/Domain/repositories/cart/add_cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase {
  CartRepository addCartRepository;

  AddToCartUseCase({required this.addCartRepository});

  Future<AddCartResponse> invoke({required String productId}) {
    return addCartRepository.addToCart(productId);
  }
}
