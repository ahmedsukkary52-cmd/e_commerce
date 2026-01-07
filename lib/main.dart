import 'package:e_commerce/core/Utils/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/Utils/routes_App.dart';
import 'features/UI/pages/Cart/cart_screen.dart';
import 'features/UI/pages/Home/home_screen.dart';
import 'features/UI/Auth/Login/login_screen.dart';
import 'features/UI/pages/Product/product_screen.dart';
import 'features/UI/Auth/Register/register_screen.dart';

void main() {
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
          initialRoute: RoutesApp.login,
          routes: {
            RoutesApp.homeScreen: (context) => const HomeScreen(),
            RoutesApp.login: (context) => LoginScreen(),
            RoutesApp.register: (context) => RegisterScreen(),
            RoutesApp.cart: (context) => const CartScreen(),
            RoutesApp.product: (context) => ProductScreen(),
          },
          theme: ThemeApp.lightTheme,
          themeMode: ThemeMode.light,
        );
      },
    );
  }
}
