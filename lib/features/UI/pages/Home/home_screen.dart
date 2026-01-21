import 'package:e_commerce/config/di.dart';
import 'package:e_commerce/core/Utils/assets_app.dart';
import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:e_commerce/features/UI/pages/Home/cubit/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeScreenViewModel viewModel = getIt<HomeScreenViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: viewModel,
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(backgroundColor: ColorApp.primaryBlue),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: viewModel.bodyList[viewModel.selectedIndex],
            ),
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadiusGeometry.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  elevation: 0,
                  currentIndex: viewModel.selectedIndex,
                  onTap: viewModel.onBottomNavTap,
                  iconSize: 24.sp,
                  items: [
                    _bottomNavBarItem(
                      isSelected: viewModel.selectedIndex == 0,
                      selectedIcon: AssetsApp.homeS,
                      unSelectedIcon: AssetsApp.home,
                    ),
                    _bottomNavBarItem(
                      isSelected: viewModel.selectedIndex == 1,
                      selectedIcon: AssetsApp.categoryS,
                      unSelectedIcon: AssetsApp.category,
                    ),
                    _bottomNavBarItem(
                      isSelected: viewModel.selectedIndex == 2,
                      selectedIcon: AssetsApp.favoriteS,
                      unSelectedIcon: AssetsApp.favorite,
                    ),
                    _bottomNavBarItem(
                      isSelected: viewModel.selectedIndex == 3,
                      selectedIcon: AssetsApp.accountS,
                      unSelectedIcon: AssetsApp.account,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  BottomNavigationBarItem _bottomNavBarItem({
    required bool isSelected,
    required String selectedIcon,
    required String unSelectedIcon,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(isSelected ? selectedIcon : unSelectedIcon),
      label: '',
    );
  }
}
