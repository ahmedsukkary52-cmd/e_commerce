import 'package:dio/dio.dart';
import 'package:e_commerce/Data/data_sources/remote/favorite_remote_data_source.dart';
import 'package:e_commerce/Domain/entities/response/favorite/add_favorite.dart';
import 'package:e_commerce/Domain/entities/response/favorite/get_favorite/get_favorite_response_dto.dart';
import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/api/mappers/cart/get_cart_mapper.dart';
import 'package:e_commerce/api/mappers/favorite/add_favorite_mapper.dart';
import 'package:e_commerce/api/mappers/favorite/get_favorite_mapper.dart';
import 'package:injectable/injectable.dart';

import '../../../core/Exceptions/exceptions_app.dart';
import '../../../core/cache/shared_prefs_utils.dart';
import '../../model/request/product_request/add_product_request_dto.dart';

@Injectable(as: FavoriteRemoteDataSource)
class FavoriteRemoteDataSourceImpl implements FavoriteRemoteDataSource {
  ApiServices apiServices;

  FavoriteRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<AddFavoriteResponse> addToFavorite({required String productId}) async {
    // TODO: implement addToFavorite
    try {
      AddProductRequestDto addProductRequestDto = AddProductRequestDto(
        productId: productId,
      );
      String? token = await SharedPrefsUtils.getData(key: 'token');
      var favoriteResponse = await apiServices.addToFavorite(
        addProductRequestDto,
        token ?? '',
      );
      return favoriteResponse.toFavorite();
    } on DioException catch (e) {
      String message = (e.error as ExceptionsApp).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }

  @override
  Future<GetFavoriteResponse> getFavoriteItem() async {
    // TODO: implement getFavoriteItem
    try {
      String? token = await SharedPrefsUtils.getData(key: 'token');
      var favoriteResponse = await apiServices.getFavoriteItem(token ?? '');
      return favoriteResponse.toFavoriteResponse();
    } on DioException catch (e) {
      String message = (e.error as ExceptionsApp).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }

  @override
  Future<GetFavoriteResponse> deleteFavoriteItem({
    required String productId,
  }) async {
    // TODO: implement deleteFavoriteItem
    try {
      String? token = await SharedPrefsUtils.getData(key: 'token');
      var favoriteResponse = await apiServices.deleteProductItem(
        productId,
        token ?? '',
      );
      return favoriteResponse.toFavoriteResponse();
    } on DioException catch (e) {
      String message = (e.error as ExceptionsApp).errorMessage;
      throw ServerError(errorMessage: message);
    }
  }
}
