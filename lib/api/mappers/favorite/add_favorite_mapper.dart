import 'package:e_commerce/Domain/entities/response/favorite/add_favorite.dart';
import 'package:e_commerce/api/model/response/favorite/add_favorite/add_favorite_response_dto.dart';

extension AddFavoriteMapper on AddFavoriteResponseDto {
  AddFavoriteResponse toFavorite() {
    return AddFavoriteResponse(message: message, status: status, data: data);
  }
}
