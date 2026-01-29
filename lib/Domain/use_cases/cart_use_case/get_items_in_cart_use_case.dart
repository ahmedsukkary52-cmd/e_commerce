import 'package:e_commerce/Domain/entities/response/cart/add_cart/add_cart_response.dart';
import 'package:e_commerce/Domain/entities/response/cart/get_cart/get_cart_response.dart';
import 'package:e_commerce/Domain/repositories/cart/add_cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetItemsInCartUseCase {
  CartRepository addCartRepository;

  GetItemsInCartUseCase({required this.addCartRepository});

  Future<GetCartResponse> invoke() {
    return addCartRepository.getItemsInCart();
  }
}
