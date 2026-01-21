import 'package:e_commerce/Domain/use_cases/get_all_brands_use_case.dart';
import 'package:e_commerce/Domain/use_cases/get_all_category_use_case.dart';
import 'package:e_commerce/core/Exceptions/exceptions_app.dart';
import 'package:e_commerce/features/UI/pages/Home/tabs/Home_tab/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../core/Utils/assets_app.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoryUseCase getAllCategoryUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;

  HomeTabViewModel({
    required this.getAllCategoryUseCase,
    required this.getAllBrandsUseCase,
  }) : super(HomeTabInitialState());
  List<String> imagesList = [
    AssetsApp.image1,
    AssetsApp.image2,
    AssetsApp.image3,
  ];

  Future<void> getCategories() async {
    try {
      emit(HomeTabLoadingState());
      var categoryList = await getAllCategoryUseCase.invoke();
      emit(HomeTabSuccessState(categoryList: categoryList));
    } on ExceptionsApp catch (e) {
      emit(HomeTabErrorState(message: e.errorMessage));
    }
  }

  Future<void> getBrands() async {
    try {
      emit(BrandLoadingState());
      var brandList = await getAllBrandsUseCase.invoke();
      emit(BrandSuccessState(brandsList: brandList));
    } on ExceptionsApp catch (e) {
      emit(BrandErrorState(message: e.errorMessage));
    }
  }
}
