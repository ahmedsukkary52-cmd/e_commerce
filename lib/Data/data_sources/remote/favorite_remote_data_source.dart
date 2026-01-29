import 'package:e_commerce/Domain/entities/response/favorite/add_favorite.dart';
import 'package:e_commerce/Domain/entities/response/favorite/get_favorite/get_favorite_response_dto.dart';

abstract class FavoriteRemoteDataSource {
  Future<AddFavoriteResponse> addToFavorite({required String productId});

  Future<GetFavoriteResponse> getFavoriteItem();

  Future<GetFavoriteResponse> deleteFavoriteItem({required String productId});
}
