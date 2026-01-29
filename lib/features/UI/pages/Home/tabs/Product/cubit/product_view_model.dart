import 'package:e_commerce/Domain/use_cases/product_use_case/get_all_products_use_case.dart';
import 'package:e_commerce/core/Exceptions/exceptions_app.dart';
import 'package:e_commerce/features/UI/pages/Home/tabs/Product/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductViewModel extends Cubit<ProductState> {
  ProductViewModel({required this.getAllProductsUseCase})
    : super(ProductLoadingState());
  GetAllProductsUseCase getAllProductsUseCase;

  Future<void> getAllProduct() async {
    try {
      emit(ProductLoadingState());
      var productsDataList = await getAllProductsUseCase.invoke();
      emit(ProductSuccessState(productList: productsDataList));
    } on ExceptionsApp catch (e) {
      emit(ProductErrorState(errorMessage: e.errorMessage));
    }
  }
}
