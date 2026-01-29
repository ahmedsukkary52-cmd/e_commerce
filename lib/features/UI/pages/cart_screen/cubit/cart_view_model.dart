import 'package:e_commerce/Domain/entities/response/cart/get_cart/get_cart_products.dart';
import 'package:e_commerce/Domain/use_cases/cart_use_case/add_to_cart_use_case.dart';
import 'package:e_commerce/Domain/use_cases/cart_use_case/delete_items_in_cart_use_case.dart';
import 'package:e_commerce/Domain/use_cases/cart_use_case/get_items_in_cart_use_case.dart';
import 'package:e_commerce/Domain/use_cases/cart_use_case/update_items_in_cart_use_case.dart';
import 'package:e_commerce/features/UI/pages/cart_screen/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/Exceptions/exceptions_app.dart';

@injectable
class CartViewModel extends Cubit<AddCartStates> {
  CartViewModel({
    required this.addToCartUseCase,
    required this.getItemsInCartUseCase,
    required this.updateItemsInCartUseCase,
    required this.deleteItemsInCartUseCase,
  }) : super(AddCartLoadingState());

  AddToCartUseCase addToCartUseCase;
  GetItemsInCartUseCase getItemsInCartUseCase;
  DeleteItemsInCartUseCase deleteItemsInCartUseCase;
  UpdateItemsInCartUseCase updateItemsInCartUseCase;

  int numOfCartItems = 0;
  List<GetCartProducts> productsList = [];

  static CartViewModel get(context) => BlocProvider.of<CartViewModel>(context);

  Future<void> addToCart(String productId, {int count = 1}) async {
    try {
      emit(AddCartLoadingState());
      var cartResponse = await addToCartUseCase.invoke(productId: productId);
      numOfCartItems = cartResponse.numOfCartItems ?? 0;
      emit(AddCartSuccessState(numOfCartItems: numOfCartItems));
    } on ExceptionsApp catch (e) {
      emit(AddCartErrorState(message: e.errorMessage));
    }
  }

  Future<void> getItemInCart() async {
    try {
      emit(GetCartLoadingState());
      var cartResponse = await getItemsInCartUseCase.invoke();
      numOfCartItems = cartResponse.numOfCartItems ?? 0;
      productsList = cartResponse.data!.products ?? [];
      emit(GetCartSuccessState(getCartData: cartResponse.data!, message: null));
    } on ExceptionsApp catch (e) {
      emit(GetCartErrorState(message: e.errorMessage));
    }
  }

  Future<void> deleteItemInCart(String productId) async {
    try {
      // emit(DeleteItemLoadingState());
      var cartResponse = await deleteItemsInCartUseCase.invoke(productId);
      numOfCartItems = cartResponse.numOfCartItems ?? 0;
      productsList = cartResponse.data!.products ?? [];
      emit(
        GetCartSuccessState(
          getCartData: cartResponse.data!,
          message: 'Deleted Item Successfully',
        ),
      );
    } on ExceptionsApp catch (e) {
      emit(DeleteItemErrorState(message: e.errorMessage));
    }
  }

  Future<void> updateItemInCart(String productId, int count) async {
    try {
      // emit(UpdateCountLoadingState());
      var cartResponse = await updateItemsInCartUseCase.invoke(
        productId,
        count,
      );
      numOfCartItems = cartResponse.numOfCartItems ?? 0;
      emit(
        GetCartSuccessState(
          getCartData: cartResponse.data!,
          message: 'Update Count Successfully',
        ),
      );
    } on ExceptionsApp catch (e) {
      emit(UpdateCountErrorState(message: e.errorMessage));
    }
  }
}
