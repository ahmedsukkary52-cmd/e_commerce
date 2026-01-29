import 'package:e_commerce/Domain/entities/response/favorite/add_favorite.dart';
import 'package:e_commerce/Domain/entities/response/favorite/get_favorite/get_favorite_response_dto.dart';

abstract class FavoriteRepository {
  Future<AddFavoriteResponse> addToFavorite(String productId);

  Future<GetFavoriteResponse> deleteFavoriteItem(String productId);

  Future<GetFavoriteResponse> getFavoriteItem();
}
