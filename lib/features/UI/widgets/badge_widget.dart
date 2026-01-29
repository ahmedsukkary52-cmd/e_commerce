import 'package:badges/badges.dart' as badges;
import 'package:e_commerce/core/Utils/assets_app.dart';
import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:e_commerce/core/Utils/routes_App.dart';
import 'package:e_commerce/core/Utils/text_app.dart';
import 'package:e_commerce/features/UI/pages/cart_screen/cubit/cart_states.dart';
import 'package:e_commerce/features/UI/pages/cart_screen/cubit/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BadgeWidget extends StatefulWidget {
  const BadgeWidget({super.key});

  @override
  State<BadgeWidget> createState() => _BadgeWidgetState();
}

class _BadgeWidgetState extends State<BadgeWidget> {
  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    return BlocBuilder<CartViewModel, AddCartStates>(
      builder: (context, state) {
        final viewModel = CartViewModel.get(context);
        return badges.Badge(
          position: badges.BadgePosition.topEnd(end: -18.w, top: -21.h),
          showBadge: true,
          ignorePointer: false,
          onTap: currentRoute != RoutesApp.cart
              ? () {
                  Navigator.pushNamed(context, RoutesApp.cart);
                }
              : null,
          badgeContent: Text(
            viewModel.numOfCartItems.toString(),
            style: TextApp.regular14White,
          ),

          badgeAnimation: badges.BadgeAnimation.rotation(
            animationDuration: Duration(seconds: 1),
            colorChangeAnimationDuration: Duration(seconds: 1),
            loopAnimation: false,
            curve: Curves.fastOutSlowIn,
            colorChangeAnimationCurve: Curves.easeInCubic,
          ),
          badgeStyle: badges.BadgeStyle(
            shape: badges.BadgeShape.circle,
            badgeColor: ColorApp.primaryBlue,
            padding: EdgeInsets.all(7.0),
            elevation: 0,
          ),
          child: SvgPicture.asset(AssetsApp.cart),
        );
      },
    );
  }
}
