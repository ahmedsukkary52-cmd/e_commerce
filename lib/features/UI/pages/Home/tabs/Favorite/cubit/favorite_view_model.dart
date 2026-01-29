import 'package:e_commerce/Domain/entities/response/product/product_data.dart';
import 'package:e_commerce/Domain/use_cases/favorite_use_case/add_to_favorite_use_case.dart';
import 'package:e_commerce/Domain/use_cases/favorite_use_case/delete_favorite_item_use_case.dart';
import 'package:e_commerce/Domain/use_cases/favorite_use_case/get_favorite_use_case.dart';
import 'package:e_commerce/features/UI/pages/Home/tabs/Favorite/cubit/favorite_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/Exceptions/exceptions_app.dart';
import '../../../../../../../core/cache/shared_prefs_utils.dart';

@injectable
class FavoriteViewModel extends Cubit<FavoriteStates> {
  FavoriteViewModel({
    required this.getFavoriteItemUseCase,
    required this.addToFavoriteUseCase,
    required this.deleteFavoriteItemUseCase,
  }) : super(FavoriteInitialState());

  final AddToFavoriteUseCase addToFavoriteUseCase;
  final GetFavoriteItemUseCase getFavoriteItemUseCase;
  final DeleteFavoriteItemUseCase deleteFavoriteItemUseCase;

  List<ProductData> favorites = [];

  Future<void> loadFavorites() async {
    try {
      emit(FavoriteListLoadingState());

      final response = await getFavoriteItemUseCase.invoke();
      favorites = response.data ?? [];

      if (favorites.isEmpty) {
        emit(FavoriteListEmptyState());
      } else {
        emit(FavoriteListSuccessState(products: favorites));
      }
    } catch (e) {
      emit(FavoriteListErrorState(message: e.toString()));
    }
  }

  Future<void> addFavorite(String productId) async {
    await addToFavoriteUseCase.invoke(productId: productId);
    await loadFavorites();
  }

  Future<void> deleteFavorite(String productId) async {
    await deleteFavoriteItemUseCase.invoke(productId);
    await loadFavorites();
  }

  bool isFavorite(String productId) {
    return favorites.any((p) => p.id == productId);
  }
}
