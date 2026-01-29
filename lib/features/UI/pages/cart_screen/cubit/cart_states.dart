import 'package:e_commerce/Domain/entities/response/cart/get_cart/get_cart_data.dart';

sealed class AddCartStates {}

class AddCartLoadingState extends AddCartStates {}

class AddCartSuccessState extends AddCartStates {
  int numOfCartItems;

  AddCartSuccessState({required this.numOfCartItems});
}

class AddCartErrorState extends AddCartStates {
  String message;

  AddCartErrorState({required this.message});
}

class GetCartLoadingState extends AddCartStates {}

class GetCartSuccessState extends AddCartStates {
  GetCartData getCartData;
  String? message;

  GetCartSuccessState({required this.getCartData, required this.message});
}

class GetCartErrorState extends AddCartStates {
  String message;

  GetCartErrorState({required this.message});
}

class DeleteItemLoadingState extends AddCartStates {}

class DeleteItemSuccessState extends AddCartStates {
  GetCartData getCartData;

  DeleteItemSuccessState({required this.getCartData});
}

class DeleteItemErrorState extends AddCartStates {
  String message;

  DeleteItemErrorState({required this.message});
}

class UpdateCountLoadingState extends AddCartStates {}

class UpdateCountSuccessState extends AddCartStates {
  GetCartData getCartData;

  UpdateCountSuccessState({required this.getCartData});
}

class UpdateCountErrorState extends AddCartStates {
  String message;

  UpdateCountErrorState({required this.message});
}
