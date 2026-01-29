import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Domain/entities/response/product/product_data.dart';
import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:e_commerce/features/UI/pages/Home/tabs/Favorite/cubit/favorite_states.dart';
import 'package:e_commerce/features/UI/pages/Home/tabs/Favorite/cubit/favorite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../core/Utils/assets_app.dart';
import '../../../../../../../core/Utils/text_app.dart';
import '../../../../../widgets/like_widget.dart';
import '../../../../cart_screen/cubit/cart_view_model.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.productData});

  final ProductData productData;

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
                imageUrl: productData.imageCover ?? '',
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
                          "${productData.title}",
                          style: TextApp.medium18DarkBlue,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      BlocBuilder<FavoriteViewModel, FavoriteStates>(
                        buildWhen: (previous, current) {
                          if (current is FavoriteListSuccessState) {
                            return current.products.any(
                              (p) => p.id == productData.id,
                            );
                          }
                          if (current is FavoriteDeleteSuccessState) {
                            return current.productId == productData.id;
                          }
                          return false;
                        },
                        builder: (context, state) {
                          final favCubit = context.read<FavoriteViewModel>();
                          final isFav = favCubit.isFavorite(
                            productData.id ?? '',
                          );

                          return LikeWidget(
                            isLike: isFav,
                            onTap: () {
                              favCubit.deleteFavorite(productData.id ?? '');
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    spacing: 4.w,
                    children: [
                      SvgPicture.asset(AssetsApp.star),
                      Text(
                        "${productData.ratingsAverage}",
                        style: TextApp.regular14DarkBlue,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "EGP ${productData.price}",
                        style: TextApp.medium18DarkBlue,
                      ),
                      InkWell(
                        onTap: () {
                          CartViewModel.get(
                            context,
                          ).addToCart(productData.id ?? '');
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 9.h,
                          ),
                          decoration: BoxDecoration(
                            color: ColorApp.primaryBlue,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            'Add To Cart',
                            style: TextApp.medium14White,
                          ),
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
