// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../api/api_services.dart' as _i124;
import '../api/data_sources/remote/add_cart_remote_data_source_impl.dart'
    as _i885;
import '../api/data_sources/remote/auth_remote_data_source_impl.dart' as _i668;
import '../api/data_sources/remote/brand_remote_data_source_impl.dart' as _i304;
import '../api/data_sources/remote/categories_remote_data_source_impl.dart'
    as _i486;
import '../api/data_sources/remote/favorite_remote_data_source_impl.dart'
    as _i921;
import '../api/data_sources/remote/product_remote_data_source_impl.dart'
    as _i544;
import '../api/data_sources/remote/user_remote_data_source_impl.dart' as _i271;
import '../api/dio/dio_module.dart' as _i223;
import '../Data/data_sources/remote/add_cart_remote_data_source.dart' as _i960;
import '../Data/data_sources/remote/auth_remote_data_source.dart' as _i186;
import '../Data/data_sources/remote/brand_remote_data_source.dart' as _i781;
import '../Data/data_sources/remote/categories_remote_data_source.dart'
    as _i176;
import '../Data/data_sources/remote/favorite_remote_data_source.dart' as _i715;
import '../Data/data_sources/remote/product_remote_data_source.dart' as _i739;
import '../Data/data_sources/remote/user_remote_date_source.dart' as _i395;
import '../Data/repositories/auth/auth_repository_impl.dart' as _i690;
import '../Data/repositories/brand/brand_repository_impl.dart' as _i1029;
import '../Data/repositories/cart/add_cart_repository_impl.dart' as _i671;
import '../Data/repositories/category/categories_repository_impl.dart' as _i56;
import '../Data/repositories/favorite/favorite_repository_impl.dart' as _i302;
import '../Data/repositories/product/product_repository_impl.dart' as _i395;
import '../Data/repositories/user_profile/user_profile_repository_impl.dart'
    as _i144;
import '../Domain/repositories/auth/auth_repository.dart' as _i687;
import '../Domain/repositories/brand/brand_repository.dart' as _i295;
import '../Domain/repositories/cart/add_cart_repository.dart' as _i748;
import '../Domain/repositories/categories/categories_repository.dart' as _i650;
import '../Domain/repositories/favorite/favorite_repository.dart' as _i491;
import '../Domain/repositories/product/product_repository.dart' as _i830;
import '../Domain/repositories/user_profile/user_profile_repository.dart'
    as _i8;
import '../Domain/use_cases/auth_use_case/login_use_case.dart' as _i471;
import '../Domain/use_cases/auth_use_case/register_use_case.dart' as _i344;
import '../Domain/use_cases/brand_use_case/get_all_brands_use_case.dart'
    as _i620;
import '../Domain/use_cases/cart_use_case/add_to_cart_use_case.dart' as _i985;
import '../Domain/use_cases/cart_use_case/delete_items_in_cart_use_case.dart'
    as _i441;
import '../Domain/use_cases/cart_use_case/get_items_in_cart_use_case.dart'
    as _i1031;
import '../Domain/use_cases/cart_use_case/update_items_in_cart_use_case.dart'
    as _i736;
import '../Domain/use_cases/category_use_case/get_all_category_use_case.dart'
    as _i403;
import '../Domain/use_cases/favorite_use_case/add_to_favorite_use_case.dart'
    as _i782;
import '../Domain/use_cases/favorite_use_case/delete_favorite_item_use_case.dart'
    as _i723;
import '../Domain/use_cases/favorite_use_case/get_favorite_use_case.dart'
    as _i214;
import '../Domain/use_cases/product_use_case/get_all_products_use_case.dart'
    as _i787;
import '../Domain/use_cases/user_profile/add_user_use_case.dart' as _i295;
import '../Domain/use_cases/user_profile/get_user_use_case.dart' as _i272;
import '../features/UI/Auth/Login/cubit/login_view_model.dart' as _i165;
import '../features/UI/Auth/Register/cubit/register_view_model.dart' as _i918;
import '../features/UI/pages/cart_screen/cubit/cart_view_model.dart' as _i424;
import '../features/UI/pages/Home/cubit/home_screen_view_model.dart' as _i206;
import '../features/UI/pages/Home/tabs/Favorite/cubit/favorite_view_model.dart'
    as _i1028;
import '../features/UI/pages/Home/tabs/Home_tab/cubit/home_tab_view_model.dart'
    as _i840;
import '../features/UI/pages/Home/tabs/Product/cubit/product_view_model.dart'
    as _i611;
import '../features/UI/pages/Home/tabs/User/cubit/user_view_model.dart'
    as _i806;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.factory<_i206.HomeScreenViewModel>(() => _i206.HomeScreenViewModel());
    gh.singleton<_i361.BaseOptions>(() => getItModule.provideBaseOptions());
    gh.singleton<_i528.PrettyDioLogger>(
      () => getItModule.providePrettyDioLogger(),
    );
    gh.singleton<_i361.Dio>(
      () => getItModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.singleton<_i124.ApiServices>(
      () => getItModule.provideApiServices(gh<_i361.Dio>()),
    );
    gh.factory<_i395.UserRemoteDataSource>(
      () =>
          _i271.UserRemoteDataSourceImpl(apiServices: gh<_i124.ApiServices>()),
    );
    gh.factory<_i715.FavoriteRemoteDataSource>(
      () => _i921.FavoriteRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i960.AddCartRemoteDataSource>(
      () => _i885.AddCartRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i739.ProductRemoteDataSource>(
      () => _i544.ProductRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i176.CategoriesRemoteDataSource>(
      () => _i486.CategoriesRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i186.AuthRemoteDataSource>(
      () =>
          _i668.AuthRemoteDataSourceImpl(apiServices: gh<_i124.ApiServices>()),
    );
    gh.factory<_i8.UserProfileRepository>(
      () => _i144.UserProfileRepositoryImpl(
        remoteDataSource: gh<_i395.UserRemoteDataSource>(),
      ),
    );
    gh.factory<_i687.AuthRepository>(
      () => _i690.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i186.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i471.LoginUseCase>(
      () => _i471.LoginUseCase(authRepository: gh<_i687.AuthRepository>()),
    );
    gh.factory<_i344.RegisterUseCase>(
      () => _i344.RegisterUseCase(authRepository: gh<_i687.AuthRepository>()),
    );
    gh.factory<_i295.AddUserUseCase>(
      () => _i295.AddUserUseCase(
        userProfileRepository: gh<_i8.UserProfileRepository>(),
      ),
    );
    gh.factory<_i781.BrandRemoteDataSource>(
      () =>
          _i304.BrandRemoteDataSourceImpl(apiServices: gh<_i124.ApiServices>()),
    );
    gh.factory<_i295.BrandRepository>(
      () => _i1029.BrandRepositoryImpl(
        remoteDataSource: gh<_i781.BrandRemoteDataSource>(),
      ),
    );
    gh.factory<_i918.RegisterViewModel>(
      () =>
          _i918.RegisterViewModel(registerUseCase: gh<_i344.RegisterUseCase>()),
    );
    gh.factory<_i491.FavoriteRepository>(
      () => _i302.FavoriteRepositoryImpl(
        remoteDataSource: gh<_i715.FavoriteRemoteDataSource>(),
      ),
    );
    gh.factory<_i830.ProductRepository>(
      () => _i395.ProductRepositoryImpl(
        remoteDataSource: gh<_i739.ProductRemoteDataSource>(),
      ),
    );
    gh.factory<_i787.GetAllProductsUseCase>(
      () => _i787.GetAllProductsUseCase(
        productRepository: gh<_i830.ProductRepository>(),
      ),
    );
    gh.factory<_i782.AddToFavoriteUseCase>(
      () => _i782.AddToFavoriteUseCase(
        favoriteRepository: gh<_i491.FavoriteRepository>(),
      ),
    );
    gh.factory<_i723.DeleteFavoriteItemUseCase>(
      () => _i723.DeleteFavoriteItemUseCase(
        favoriteRepository: gh<_i491.FavoriteRepository>(),
      ),
    );
    gh.factory<_i214.GetFavoriteItemUseCase>(
      () => _i214.GetFavoriteItemUseCase(
        favoriteRepository: gh<_i491.FavoriteRepository>(),
      ),
    );
    gh.factory<_i748.CartRepository>(
      () => _i671.AddCartRepositoryImpl(
        remoteDataSource: gh<_i960.AddCartRemoteDataSource>(),
      ),
    );
    gh.factory<_i611.ProductViewModel>(
      () => _i611.ProductViewModel(
        getAllProductsUseCase: gh<_i787.GetAllProductsUseCase>(),
      ),
    );
    gh.factory<_i165.LoginViewModel>(
      () => _i165.LoginViewModel(loginUseCase: gh<_i471.LoginUseCase>()),
    );
    gh.factory<_i441.DeleteItemsInCartUseCase>(
      () => _i441.DeleteItemsInCartUseCase(
        cartRepository: gh<_i748.CartRepository>(),
      ),
    );
    gh.factory<_i736.UpdateItemsInCartUseCase>(
      () => _i736.UpdateItemsInCartUseCase(
        cartRepository: gh<_i748.CartRepository>(),
      ),
    );
    gh.factory<_i272.GetUserUseCase>(
      () => _i272.GetUserUseCase(repository: gh<_i8.UserProfileRepository>()),
    );
    gh.factory<_i650.CategoriesRepository>(
      () => _i56.CategoriesRepositoryImpl(
        remoteDataSource: gh<_i176.CategoriesRemoteDataSource>(),
      ),
    );
    gh.factory<_i806.UserViewModel>(
      () => _i806.UserViewModel(
        addUserUseCase: gh<_i295.AddUserUseCase>(),
        getUserUseCase: gh<_i272.GetUserUseCase>(),
      ),
    );
    gh.factory<_i620.GetAllBrandsUseCase>(
      () => _i620.GetAllBrandsUseCase(
        brandRepository: gh<_i295.BrandRepository>(),
      ),
    );
    gh.factory<_i985.AddToCartUseCase>(
      () =>
          _i985.AddToCartUseCase(addCartRepository: gh<_i748.CartRepository>()),
    );
    gh.factory<_i1031.GetItemsInCartUseCase>(
      () => _i1031.GetItemsInCartUseCase(
        addCartRepository: gh<_i748.CartRepository>(),
      ),
    );
    gh.factory<_i403.GetAllCategoryUseCase>(
      () => _i403.GetAllCategoryUseCase(
        categoriesRepository: gh<_i650.CategoriesRepository>(),
      ),
    );
    gh.factory<_i424.CartViewModel>(
      () => _i424.CartViewModel(
        addToCartUseCase: gh<_i985.AddToCartUseCase>(),
        getItemsInCartUseCase: gh<_i1031.GetItemsInCartUseCase>(),
        updateItemsInCartUseCase: gh<_i736.UpdateItemsInCartUseCase>(),
        deleteItemsInCartUseCase: gh<_i441.DeleteItemsInCartUseCase>(),
      ),
    );
    gh.factory<_i840.HomeTabViewModel>(
      () => _i840.HomeTabViewModel(
        getAllCategoryUseCase: gh<_i403.GetAllCategoryUseCase>(),
        getAllBrandsUseCase: gh<_i620.GetAllBrandsUseCase>(),
      ),
    );
    gh.factory<_i1028.FavoriteViewModel>(
      () => _i1028.FavoriteViewModel(
        getFavoriteItemUseCase: gh<_i214.GetFavoriteItemUseCase>(),
        addToFavoriteUseCase: gh<_i782.AddToFavoriteUseCase>(),
        deleteFavoriteItemUseCase: gh<_i723.DeleteFavoriteItemUseCase>(),
      ),
    );
    return this;
  }
}

class _$GetItModule extends _i223.GetItModule {}
