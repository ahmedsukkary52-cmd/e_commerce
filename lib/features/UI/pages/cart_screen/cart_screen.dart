import 'package:e_commerce/core/Utils/assets_app.dart';
import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:e_commerce/core/Utils/text_app.dart';
import 'package:e_commerce/core/Utils/toast_utils.dart';
import 'package:e_commerce/features/UI/pages/Home/widget/main_error_widget.dart';
import 'package:e_commerce/features/UI/pages/Home/widget/main_loading_widget.dart';
import 'package:e_commerce/features/UI/pages/cart_screen/cubit/cart_states.dart';
import 'package:e_commerce/features/UI/pages/cart_screen/cubit/cart_view_model.dart';
import 'package:e_commerce/features/UI/pages/cart_screen/widget/cart_item.dart';
import 'package:e_commerce/features/UI/widgets/badge_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CartViewModel.get(context).getItemInCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.transparent,
        title: Text('Cart', style: TextApp.medium20DarkBlue),
        centerTitle: true,
        actionsPadding: EdgeInsets.only(right: 36.w),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AssetsApp.search),
            padding: EdgeInsets.only(right: 16.w),
          ),
          BadgeWidget(),
        ],
      ),
      body: BlocListener<CartViewModel, AddCartStates>(
        listener: (BuildContext context, AddCartStates state) {
          if (state is GetCartSuccessState && state.message != null) {
            ToastMessage.toastMsg(
              message: state.message!,
              textColor: ColorApp.primaryWhite,
              background: ColorApp.greenColor,
            );
          }
        },
        child: BlocBuilder<CartViewModel, AddCartStates>(
          builder: (context, state) {
            if (state is GetCartErrorState) {
              return MainErrorWidget(errorMessage: state.message);
            } else if (state is GetCartSuccessState) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => CartItem(
                          getCartProducts: state.getCartData.products![index],
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 12.h),
                        itemCount: state.getCartData.products?.length ?? 0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 18.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 8.h,
                            children: [
                              Text("Total Price", style: TextApp.medium18Gray),
                              Text(
                                'EGP ${state.getCartData.totalCartPrice}',
                                style: TextApp.medium18DarkBlue,
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 32.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22.r),
                              color: ColorApp.primaryBlue,
                            ),
                            child: Row(
                              spacing: 24.w,
                              children: [
                                Text('Check Out', style: TextApp.medium20White),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: ColorApp.primaryWhite,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const MainLoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
