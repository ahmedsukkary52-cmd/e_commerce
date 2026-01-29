import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Domain/entities/response/product/product_data.dart';
import 'package:e_commerce/core/Utils/assets_app.dart';
import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:e_commerce/core/Utils/text_app.dart';
import 'package:e_commerce/features/UI/pages/Home/tabs/Favorite/cubit/favorite_states.dart';
import 'package:e_commerce/features/UI/pages/Home/tabs/Favorite/cubit/favorite_view_model.dart';
import 'package:e_commerce/features/UI/pages/cart_screen/cubit/cart_view_model.dart';
import 'package:e_commerce/features/UI/widgets/like_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductItem extends StatelessWidget {
  final ProductData productData;
  const ProductItem({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorApp.strokeBlue, width: 2),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  width: double.maxFinite,
                  height: 134.h,
                  fit: BoxFit.contain,
                  imageUrl: productData.imageCover ?? '',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 1.8,
                      color: ColorApp.gray,
                    ),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: Icon(Icons.error, color: ColorApp.redColor),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: BlocBuilder<FavoriteViewModel, FavoriteStates>(
                  buildWhen: (previous, current) {
                    if (current is FavoriteSuccessState) {
                      return current.productId == productData.id;
                    }
                    return current is FavoriteListSuccessState;
                  },
                  builder: (context, state) {
                    final favCubit = context.read<FavoriteViewModel>();
                    final isFav = favCubit.isFavorite(productData.id ?? '');

                    return LikeWidget(
                      isLike: isFav,
                      onTap: () {
                        if (isFav) {
                          favCubit.deleteFavorite(productData.id ?? '');
                        } else {
                          favCubit.addFavorite(productData.id ?? '');
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: 8.w,
              vertical: 8.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productData.title ?? '',
                  maxLines: 1,
                  style: TextApp.regular14DarkBlue,
                ),
                SizedBox(height: 8.h),
                Row(
                  spacing: 20.w,
                  children: [
                    Text(
                      'EGP ${productData.price}',
                      maxLines: 1,
                      style: TextApp.regular14DarkBlue,
                    ),
                    Text(
                      "${productData.price! * 2}",
                      maxLines: 1,
                      style: TextApp.oldPriceRegular11Blue,
                    ),
                  ],
                ),
                Row(
                  spacing: 4.w,
                  children: [
                    Text(
                      'Review (${productData.ratingsAverage})',
                      maxLines: 1,
                      style: TextApp.regular12DarkBlue,
                    ),
                    SvgPicture.asset(AssetsApp.star),
                    const Spacer(flex: 1),
                    InkWell(
                      onTap: () {
                        CartViewModel.get(
                          context,
                        ).addToCart(productData.id ?? '');
                      },
                      splashColor: ColorApp.transparent,
                      child: SvgPicture.asset(AssetsApp.addPro),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
