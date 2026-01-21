import 'package:e_commerce/config/my_bloc_observer.dart';
import 'package:e_commerce/core/Utils/theme_app.dart';
import 'package:e_commerce/features/UI/pages/Home/tabs/Home_tab/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/di.dart';
import 'core/Utils/routes_App.dart';
import 'features/UI/pages/Home/home_screen.dart';
import 'features/UI/Auth/Login/login_screen.dart';
import 'features/UI/Auth/Register/register_screen.dart';
import 'features/UI/pages/Home/tabs/Favorite/favorite_screen.dart';
import 'features/UI/pages/Home/tabs/Product/product_details/product_details.dart';
import 'features/UI/pages/Home/tabs/Product/product_screen.dart';
import 'features/UI/pages/Home/tabs/User/user_screen.dart';

void main() {
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesApp.homeScreen,
          routes: {
            RoutesApp.homeScreen: (context) => HomeScreen(),
            RoutesApp.login: (context) => LoginScreen(),
            RoutesApp.register: (context) => RegisterScreen(),
            RoutesApp.user: (context) => UserScreen(),
            RoutesApp.product: (context) => ProductScreen(),
            RoutesApp.favorite: (context) => FavoriteScreen(),
            RoutesApp.homeTab: (context) => HomeTab(),
            RoutesApp.productDetails: (context) => ProductDetails(),
          },
          theme: ThemeApp.lightTheme,
          themeMode: ThemeMode.light,
        );
      },
    );
  }
}
