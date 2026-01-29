import 'package:dio/dio.dart';
import 'package:e_commerce/Domain/entities/response/cart/add_cart/add_cart_response.dart';
import 'package:e_commerce/Domain/entities/response/cart/get_cart/get_cart_response.dart';
import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/mappers/cart/cart_mapper.dart';
import 'package:e_commerce/api/mappers/cart/get_cart_mapper.dart';
import 'package:e_commerce/api/model/request/product_request/add_product_request_dto.dart';
import 'package:e_commerce/api/model/request/count_request/count_request_dto.dart';
import 'package:e_commerce/core/Exceptions/exceptions_app.dart';
import 'package:e_commerce/core/cache/shared_prefs_utils.dart';
import 'package:injectable/injectable.dart';
import '../../../Data/data_sources/remote/add_cart_remote_data_source.dart';

@Injectable(as: AddCartRemoteDataSource)
class AddCartRemoteDataSourceImpl implements AddCartRemoteDataSource {
  ApiServices apiServices;

  AddCartRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<AddCartResponse> addToCart({required String productId}) async {
    try {
      AddProductRequestDto addProductRequestDto = AddProductRequestDto(
        productId: productId,
      );
      String? token = await SharedPrefsUtils.getData(key: 'token');
      var cartResponse = await apiServices.addToCart(
        addProductRequestDto,
        token ?? '',
      );
      return cartResponse.toCartResponse();
    } on DioException catch (e) {
      String message = (e.error as ExceptionsApp).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }

  @override
  Future<GetCartResponse> getItemsInCart() async {
    try {
      String? token = await SharedPrefsUtils.getData(key: 'token');
      var cartResponse = await apiServices.getItemsInCart(token ?? '');
      return cartResponse.toGetCartResponse();
    } on DioException catch (e) {
      String message = (e.error as ExceptionsApp).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }

  @override
  Future<GetCartResponse> deleteCartItem(String productId) async {
    // TODO: implement deleteCartItem
    try {
      String? token = await SharedPrefsUtils.getData(key: 'token');
      var cartResponse = await apiServices.deleteCartItem(
        productId,
        token ?? '',
      );
      return cartResponse.toGetCartResponse();
    } on DioException catch (e) {
      String message = (e.error as ExceptionsApp).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }

  @override
  Future<GetCartResponse> updateCountInCart(String productId, int count) async {
    // TODO: implement updateCountInCart
    try {
      String? token = await SharedPrefsUtils.getData(key: 'token');
      CountRequestDto countRequestDto = CountRequestDto(count: '$count');
      var cartResponse = await apiServices.updateCountInCart(
        productId,
        token ?? '',
        countRequestDto,
      );
      return cartResponse.toGetCartResponse();
    } on DioException catch (e) {
      String message = (e.error as ExceptionsApp).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}
