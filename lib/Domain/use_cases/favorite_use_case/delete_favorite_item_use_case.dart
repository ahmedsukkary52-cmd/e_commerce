import 'package:e_commerce/Domain/repositories/favorite/favorite_repository.dart';
import 'package:injectable/injectable.dart';

import '../../entities/response/favorite/get_favorite/get_favorite_response_dto.dart';

@injectable
class DeleteFavoriteItemUseCase {
  FavoriteRepository favoriteRepository;

  DeleteFavoriteItemUseCase({required this.favoriteRepository});

  Future<GetFavoriteResponse> invoke(String productId) {
    return favoriteRepository.deleteFavoriteItem(productId);
  }
}
