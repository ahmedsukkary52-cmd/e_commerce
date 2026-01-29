import 'package:e_commerce/Domain/entities/response/cart/get_cart/get_cart_response.dart';
import 'package:e_commerce/api/mappers/cart/get_cart_data_mapper.dart';
import 'package:e_commerce/api/model/response/cart/get_cart/get_cart_response_dto.dart';

extension GetCartMapperCartMapper on GetCartResponseDto {
  GetCartResponse toGetCartResponse() {
    return GetCartResponse(
      data: data?.toCartData(),
      cartId: cartId,
      numOfCartItems: numOfCartItems,
      status: status,
    );
  }
}
