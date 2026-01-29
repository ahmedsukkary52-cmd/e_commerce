import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Domain/entities/response/cart/get_cart/get_cart_products.dart';
import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:e_commerce/features/UI/pages/Home/widget/counter_widget.dart';
import 'package:e_commerce/features/UI/pages/cart_screen/cubit/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/Utils/assets_app.dart';
import '../../../../../../../core/Utils/text_app.dart';

class CartItem extends StatelessWidget {
  CartItem({super.key, required this.getCartProducts});

  GetCartProducts getCartProducts;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 130.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(width: 1, color: ColorApp.strokeBlue),
      ),
      child: Row(
        children: [
          Container(
            height: 130.h,
            width: 120.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(width: 1, color: ColorApp.strokeBlue),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: CachedNetworkImage(
                imageUrl: getCartProducts.product?.imageCover ?? '',
                height: 130.h,
                width: 120.w,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(Icons.error, color: ColorApp.redColor),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 8.w,
                right: 16.w,
                top: 8.h,
                bottom: 8.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "${getCartProducts.product?.title}",
                          style: TextApp.medium18DarkBlue,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          CartViewModel.get(
                            context,
                          ).deleteItemInCart(getCartProducts.product?.id ?? '');
                        },
                        icon: SvgPicture.asset(AssetsApp.delete),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 4.w,
                    children: [
                      SvgPicture.asset(AssetsApp.star),
                      Text(
                        "${getCartProducts.product?.ratingsAverage}",
                        style: TextApp.regular14DarkBlue,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "EGP ${getCartProducts.price}",
                        style: TextApp.medium18DarkBlue,
                      ),
                      SizedBox(
                        height: 40.h,
                        child: CounterWidget(
                          counter: getCartProducts.count ?? 0,
                          onTapIncrement: () {
                            int count = getCartProducts.count ?? 0;
                            count++;
                            CartViewModel.get(context).updateItemInCart(
                              getCartProducts.product?.id ?? '',
                              count,
                            );
                          },
                          onTapDecement: () {
                            int count = getCartProducts.count ?? 0;
                            if (count > 1) {
                              count--;
                            }
                            CartViewModel.get(context).updateItemInCart(
                              getCartProducts.product?.id ?? '',
                              count,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
