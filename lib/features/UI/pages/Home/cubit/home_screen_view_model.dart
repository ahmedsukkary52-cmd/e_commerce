import 'package:e_commerce/features/UI/pages/Home/cubit/home_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../tabs/Favorite/favorite_screen.dart';
import '../tabs/Home_tab/home_tab.dart';
import '../tabs/Product/product_screen.dart';
import '../tabs/User/user_screen.dart';

@injectable
class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  HomeScreenViewModel() : super(HomeInitialState());

  List<Widget> bodyList = [
    HomeTab(),
    ProductScreen(),
    FavoriteScreen(),
    UserScreen(),
  ];

  int selectedIndex = 0;

  void onBottomNavTap(int index) {
    selectedIndex = index;
    emit(ChangeSelectedIndexState());
  }
}
