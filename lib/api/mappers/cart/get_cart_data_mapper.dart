import 'package:e_commerce/Domain/entities/response/cart/get_cart/get_cart_data.dart';
import 'package:e_commerce/api/mappers/cart/get_cart_product_mapper.dart';
import 'package:e_commerce/api/model/response/cart/get_cart/get_cart_data_dto.dart';

extension GetCartDataMapper on GetCartDataDto {
  GetCartData toCartData() {
    return GetCartData(
      v: v,
      totalCartPrice: totalCartPrice,
      products:
          products?.map((proDto) => proDto.toCartProduct()).toList() ?? [],
      cartOwner: cartOwner,
      updatedAt: updatedAt,
      createdAt: createdAt,
      id: id,
    );
  }
}
