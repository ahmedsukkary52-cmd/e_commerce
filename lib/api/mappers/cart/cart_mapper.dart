import 'package:e_commerce/Domain/entities/response/cart/add_cart/add_cart_response.dart';
import 'package:e_commerce/api/mappers/cart/cart_data_mapper.dart';
import 'package:e_commerce/api/model/response/cart/add_cart/add_cart_response_dto.dart';

extension CartMapper on AddCartResponseDto {
  AddCartResponse toCartResponse() {
    return AddCartResponse(
      data: data!.toData(),
      message: message,
      cartId: cartId,
      numOfCartItems: numOfCartItems,
      status: status,
    );
  }
}
