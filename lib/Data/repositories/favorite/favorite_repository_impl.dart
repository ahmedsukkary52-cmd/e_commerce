import 'package:e_commerce/Data/data_sources/remote/favorite_remote_data_source.dart';
import 'package:e_commerce/Domain/entities/response/favorite/add_favorite.dart';
import 'package:e_commerce/Domain/entities/response/favorite/get_favorite/get_favorite_response_dto.dart';
import 'package:e_commerce/Domain/repositories/favorite/favorite_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FavoriteRepository)
class FavoriteRepositoryImpl implements FavoriteRepository {
  FavoriteRemoteDataSource remoteDataSource;

  FavoriteRepositoryImpl({required this.remoteDataSource});

  @override
  Future<AddFavoriteResponse> addToFavorite(String productId) {
    return remoteDataSource.addToFavorite(productId: productId);
  }

  @override
  Future<GetFavoriteResponse> getFavoriteItem() {
    return remoteDataSource.getFavoriteItem();
  }

  @override
  Future<GetFavoriteResponse> deleteFavoriteItem(String productId) {
    return remoteDataSource.deleteFavoriteItem(productId: productId);
  }
}
