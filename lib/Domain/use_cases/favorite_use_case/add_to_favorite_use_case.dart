import 'package:e_commerce/Domain/entities/response/favorite/add_favorite.dart';
import 'package:e_commerce/Domain/repositories/favorite/favorite_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToFavoriteUseCase {
  FavoriteRepository favoriteRepository;

  AddToFavoriteUseCase({required this.favoriteRepository});

  Future<AddFavoriteResponse> invoke({required String productId}) {
    return favoriteRepository.addToFavorite(productId);
  }
}
