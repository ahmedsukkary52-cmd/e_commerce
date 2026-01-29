import 'package:e_commerce/Domain/entities/response/cart/get_cart/get_cart_products.dart';
import 'package:e_commerce/api/mappers/product/product_mapper.dart';
import '../../model/response/cart/get_cart/get_cart_products_dto.dart';

extension GetCartProductMapper on GetCartProductsDto {
  GetCartProducts toCartProduct() {
    return GetCartProducts(
      id: id,
      price: price,
      count: count,
      product: product?.toProductData(),
    );
  }
}
