import 'package:e_commerce/Domain/entities/response/product/product_data.dart';

abstract class ProductState {}

class ProductLoadingState extends ProductState {}

class ProductSuccessState extends ProductState {
  List<ProductData>? productList;

  ProductSuccessState({required this.productList});
}

class ProductErrorState extends ProductState {
  String errorMessage;

  ProductErrorState({required this.errorMessage});
}
