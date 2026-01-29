import 'package:e_commerce/config/di.dart';
import 'package:e_commerce/core/Utils/assets_app.dart';
import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:e_commerce/core/Utils/text_app.dart';
import 'package:e_commerce/features/UI/pages/Home/cubit/home_screen_view_model.dart';
import 'package:e_commerce/features/UI/pages/Home/tabs/Favorite/cubit/favorite_view_model.dart';
import 'package:e_commerce/features/UI/pages/cart_screen/cubit/cart_view_model.dart';
import 'package:e_commerce/features/UI/widgets/badge_widget.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    CartViewModel.get(context).getItemInCart();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FavoriteViewModel>().loadFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: viewModel,
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: _buildAppBar(viewModel.selectedIndex),
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
      },
    );
  }

  OutlineInputBorder _buildCustomBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.r),
      borderSide: BorderSide(color: ColorApp.primaryBlue, width: 1),
    );
  }

  PreferredSizeWidget _buildAppBar(int index) {
    return AppBar(
      backgroundColor: ColorApp.transparent,
      elevation: 0,
      leadingWidth: double.infinity,
      toolbarHeight: index != 3 ? 120.h : kToolbarHeight,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Image.asset(AssetsApp.route, width: 66.w, height: 22.h),
            ),
            Visibility(
              visible: index != 3,
              child: Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextApp.medium14Blue,
                        cursorColor: ColorApp.primaryBlue,
                        onTap: () {
                          // todo: implement search logic
                        },
                        decoration: InputDecoration(
                          border: _buildCustomBorder(),
                          enabledBorder: _buildCustomBorder(),
                          focusedBorder: _buildCustomBorder(),
                          contentPadding: EdgeInsets.all(16.h),
                          hintStyle: TextApp.light14Blue,
                          hintText: 'What do you search for?',
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(16.h),
                            child: SvgPicture.asset(AssetsApp.search),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 18.w),
                    Column(
                      children: [
                        const BadgeWidget(),
                        SizedBox(height: 8.h),
                      ],
                    ),
                    SizedBox(width: 4.w),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
