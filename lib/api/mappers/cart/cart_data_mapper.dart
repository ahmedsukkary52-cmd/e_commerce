import 'package:e_commerce/Domain/entities/response/cart/add_cart/add_cart_data.dart';
import 'package:e_commerce/api/mappers/cart/cart_product_mapper.dart';
import 'package:e_commerce/api/model/response/cart/add_cart/add_cart_data_dto.dart';

extension CartDataMapper on AddCartDataDto {
  AddCartData toData() {
    return AddCartData(
      v: v,
      totalCartPrice: totalCartPrice,
      products: products?.map((proDto) => proDto.toProduct()).toList() ?? [],
      cartOwner: cartOwner,
      updatedAt: updatedAt,
      createdAt: createdAt,
      id: id,
    );
  }
}
