import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:flutter/material.dart';

class ThemeApp {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: ColorApp.primaryBlue,
    scaffoldBackgroundColor: ColorApp.primaryWhite,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: ColorApp.primaryWhite,
      iconTheme: IconThemeData(color: ColorApp.primaryBlue),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: ColorApp.primaryBlue,
      type: BottomNavigationBarType.fixed,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: ColorApp.primaryBlue,
    ),
  );
}
