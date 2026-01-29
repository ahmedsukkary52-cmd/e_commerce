import 'package:e_commerce/Domain/entities/response/product/product_data.dart';

sealed class FavoriteStates {}

class FavoriteInitialState extends FavoriteStates {}

class FavoriteLoadingState extends FavoriteStates {
  final String productId;

  FavoriteLoadingState({required this.productId});
}

class FavoriteSuccessState extends FavoriteStates {
  final String productId;
  final bool isLiked;

  FavoriteSuccessState({required this.productId, required this.isLiked});
}

class FavoriteErrorState extends FavoriteStates {
  final String message;

  FavoriteErrorState({required this.message});
}

class FavoriteListLoadingState extends FavoriteStates {}

class FavoriteListEmptyState extends FavoriteStates {}

class FavoriteListSuccessState extends FavoriteStates {
  final List<ProductData> products;

  FavoriteListSuccessState({required this.products});
}

class FavoriteListErrorState extends FavoriteStates {
  final String message;

  FavoriteListErrorState({required this.message});
}

class FavoriteDeleteLoadingState extends FavoriteStates {}

class FavoriteDeleteErrorState extends FavoriteStates {
  final String message;

  FavoriteDeleteErrorState({required this.message});
}

class FavoriteDeleteSuccessState extends FavoriteStates {
  final String productId;

  FavoriteDeleteSuccessState({required this.productId});
}
