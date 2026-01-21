import 'package:e_commerce/Domain/entities/response/brand/brand_data.dart';

import '../../../../../../../Domain/entities/response/category/category.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class HomeTabLoadingState extends HomeTabStates {}

class BrandLoadingState extends HomeTabStates {}

class BrandErrorState extends HomeTabStates {
  String message;

  BrandErrorState({required this.message});
}

class HomeTabErrorState extends HomeTabStates {
  String message;

  HomeTabErrorState({required this.message});
}

class HomeTabSuccessState extends HomeTabStates {
  List<Category>? categoryList;

  HomeTabSuccessState({required this.categoryList});
}

class BrandSuccessState extends HomeTabStates {
  List<Data>? brandsList;

  BrandSuccessState({required this.brandsList});
}
