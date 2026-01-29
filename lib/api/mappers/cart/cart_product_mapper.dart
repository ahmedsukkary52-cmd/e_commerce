import 'package:e_commerce/Domain/entities/response/cart/add_cart/add_cart_product.dart';
import 'package:e_commerce/api/model/response/cart/add_cart/add_cart_product_dto.dart';

extension CartProductMapper on AddCartProductDto {
  AddCartProduct toProduct() {
    return AddCartProduct(id: id, price: price, count: count, product: product);
  }
}
