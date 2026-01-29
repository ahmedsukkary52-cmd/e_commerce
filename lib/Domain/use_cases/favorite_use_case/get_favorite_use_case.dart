import 'package:e_commerce/Domain/entities/response/favorite/get_favorite/get_favorite_response_dto.dart';
import 'package:e_commerce/Domain/repositories/favorite/favorite_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFavoriteItemUseCase {
  FavoriteRepository favoriteRepository;

  GetFavoriteItemUseCase({required this.favoriteRepository});

  Future<GetFavoriteResponse> invoke() {
    return favoriteRepository.getFavoriteItem();
  }
}
