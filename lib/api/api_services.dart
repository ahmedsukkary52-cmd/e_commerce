import 'package:dio/dio.dart';
import 'package:e_commerce/api/api_end_point.dart';
import 'package:e_commerce/api/model/request/product_request/add_product_request_dto.dart';
import 'package:e_commerce/api/model/request/count_request/count_request_dto.dart';
import 'package:e_commerce/api/model/request/auth_request/login_request_dto.dart';
import 'package:e_commerce/api/model/request/auth_request/register_request_dto.dart';
import 'package:e_commerce/api/model/request/user_request/user_profile_request_dto.dart';
import 'package:e_commerce/api/model/response/auth/auth_response_dto.dart';
import 'package:e_commerce/api/model/response/brand/brand_response_dto.dart';
import 'package:e_commerce/api/model/response/cart/add_cart/add_cart_response_dto.dart';
import 'package:e_commerce/api/model/response/cart/get_cart/get_cart_response_dto.dart';
import 'package:e_commerce/api/model/response/category/category_response_dto.dart';
import 'package:e_commerce/api/model/response/favorite/add_favorite/add_favorite_response_dto.dart';
import 'package:e_commerce/api/model/response/favorite/get_favorite/get_favorite_response_dto.dart';
import 'package:e_commerce/api/model/response/product/product_response_dto.dart';
import 'package:e_commerce/api/model/response/user_profile/add_user/user_profile_response_dto.dart';
import 'package:e_commerce/api/model/response/user_profile/get_user/get_user_response_dto.dart';
import 'package:e_commerce/features/UI/pages/Home/widget/counter_widget.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiEndPoint.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(ApiEndPoint.login)
  Future<AuthResponseDto> login(@Body() LoginRequestDto loginRequest);

  @POST(ApiEndPoint.register)
  Future<AuthResponseDto> register(@Body() RegisterRequestDto registerRequest);

  @GET(ApiEndPoint.allCategories)
  Future<CategoryResponseDto> getAllCategories();

  @GET(ApiEndPoint.brands)
  Future<BrandResponseDto> getAllBrands();

  @GET(ApiEndPoint.products)
  Future<ProductResponseDto> getAllProducts();

  @POST(ApiEndPoint.user)
  Future<UserProfileResponseDto> addUser(
      @Body() UserProfileRequestDto userProfileRequest,
      @Header('token') String token,);

  @POST(ApiEndPoint.cart)
  Future<AddCartResponseDto> addToCart(
      @Body() AddProductRequestDto addProductRequestDto,
      @Header('token') String token);

  @POST(ApiEndPoint.favorite)
  Future<AddFavoriteResponseDto> addToFavorite(
      @Body() AddProductRequestDto addProductRequestDto,
      @Header('token') String token);

  @GET(ApiEndPoint.cart)
  Future<GetCartResponseDto> getItemsInCart(@Header('token') String token);

  @GET(ApiEndPoint.user)
  Future<GetUserResponseDto> getUser(@Header('token') String token);

  @GET(ApiEndPoint.favorite)
  Future<GetFavoriteResponseDto> getFavoriteItem(@Header('token') String token);

  @DELETE(ApiEndPoint.deleteCartItem)
  Future<GetCartResponseDto> deleteCartItem(@Path() String productId,
      @Header('token') String token);

  @DELETE(ApiEndPoint.deleteFavoriteItem)
  Future<GetFavoriteResponseDto> deleteProductItem(@Path() String productId,
      @Header('token') String token);

  @PUT(ApiEndPoint.deleteCartItem)
  Future<GetCartResponseDto> updateCountInCart(@Path() String productId,
      @Header('token') String token,
      @Body() CountRequestDto countRequestDto);

}
