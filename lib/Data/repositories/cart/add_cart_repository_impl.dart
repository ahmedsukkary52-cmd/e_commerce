import 'package:e_commerce/Data/data_sources/remote/add_cart_remote_data_source.dart';
import 'package:e_commerce/Domain/entities/response/cart/add_cart/add_cart_response.dart';
import 'package:e_commerce/Domain/entities/response/cart/get_cart/get_cart_response.dart';
import 'package:e_commerce/Domain/repositories/cart/add_cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class AddCartRepositoryImpl implements CartRepository {
  AddCartRemoteDataSource remoteDataSource;

  AddCartRepositoryImpl({required this.remoteDataSource});

  @override
  Future<AddCartResponse> addToCart(String productId) {
    return remoteDataSource.addToCart(productId: productId);
  }

  @override
  Future<GetCartResponse> getItemsInCart() {
    return remoteDataSource.getItemsInCart();
  }

  @override
  Future<GetCartResponse> deleteCartItem(String productId) {
    // TODO: implement deleteCartItem
    return remoteDataSource.deleteCartItem(productId);
  }

  @override
  Future<GetCartResponse> updateCountInCart(String productId, int count) {
    // TODO: implement updateCountInCart
    return remoteDataSource.updateCountInCart(productId, count);
  }
}
