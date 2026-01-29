import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:e_commerce/core/Utils/text_app.dart';
import 'package:e_commerce/features/UI/pages/Home/tabs/Favorite/cubit/favorite_states.dart';
import 'package:e_commerce/features/UI/pages/Home/tabs/Favorite/cubit/favorite_view_model.dart';
import 'package:e_commerce/features/UI/pages/Home/widget/counter_widget.dart';
import 'package:e_commerce/features/UI/pages/cart_screen/cubit/cart_view_model.dart';
import 'package:e_commerce/features/UI/widgets/badge_widget.dart';
import 'package:e_commerce/features/UI/widgets/like_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';

import '../../../../../../../Domain/entities/response/product/product_data.dart';
import '../../../../../../../core/Utils/assets_app.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int productCounter = 1;

  @override
  Widget build(BuildContext context) {
    final product =
    ModalRoute
        .of(context)!
        .settings
        .arguments as ProductData;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details', style: TextApp.semiBold20Blue),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AssetsApp.search),
          ),
          const BadgeWidget(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: ColorApp.strokeBlue, width: 2),
                ),
                child: Stack(
                  children: [
                    _buildImagesSec(images: product.images ?? []),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: BlocBuilder<FavoriteViewModel, FavoriteStates>(
                        buildWhen: (previous, current) {
                          if (current is FavoriteSuccessState) {
                            return current.productId == product.id;
                          }
                          return current is FavoriteListSuccessState;
                        },
                        builder: (context, state) {
                          final favCubit =
                          context.read<FavoriteViewModel>();
                          final isFav =
                          favCubit.isFavorite(product.id ?? '');

                          return LikeWidget(
                            isLike: isFav,
                            onTap: () {
                              if (isFav) {
                                favCubit.deleteFavorite(product.id ?? '');
                              } else {
                                favCubit.addFavorite(product.id ?? '');
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      product.title ?? '',
                      style: TextApp.medium18DarkBlue,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    'EGP ${product.price}',
                    style: TextApp.medium18DarkBlue,
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorApp.strokeBlue,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                      child: Text(
                        '${product.sold}',
                        style: TextApp.medium14DarkBlue,
                      ),
                    ),
                  ),
                  SizedBox(width: 18.w),
                  SvgPicture.asset(AssetsApp.star),
                  SizedBox(width: 4.w),
                  Text(
                    '${product.ratingsQuantity} (${product.ratingsAverage})',
                    style: TextApp.regular14DarkBlue,
                  ),
                  SizedBox(width: 18.w),
                  SizedBox(
                    height: 40.h,
                    child: CounterWidget(
                      counter: productCounter,
                      onTapIncrement: () {
                        setState(() {
                          productCounter++;
                        });
                      },
                      onTapDecement: () {
                        if (productCounter > 1) {
                          setState(() {
                            productCounter--;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12.h),

              Text('Description', style: TextApp.medium18DarkBlue),
              SizedBox(height: 8.h),
              ReadMoreText(
                product.description ?? '',
                style: TextApp.medium14DTB,
                trimLines: 3,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Read More',
                trimExpandedText: ' Read Less',
                colorClickableText: ColorApp.primaryBlue,
              ),

              SizedBox(height: 30.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Price',
                          style: TextApp.medium18Gray),
                      SizedBox(height: 4.h),
                      Text(
                        'EGP ${product.price! * productCounter}',
                        style: TextApp.medium18DarkBlue,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      CartViewModel.get(context).addToCart(
                          product.id ?? '',
                          count: productCounter
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22.r),
                        color: ColorApp.primaryBlue,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AssetsApp.addToCart),
                          SizedBox(width: 16.w),
                          Text(
                            'Add To Cart',
                            style: TextApp.medium20White,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ImageSlideshow _buildImagesSec({required List<String> images}) {
    return ImageSlideshow(
      indicatorColor: ColorApp.primaryBlue,
      height: 300.h,
      autoPlayInterval: 5000,
      isLoop: true,
      indicatorRadius: 5,
      indicatorBottomPadding: 15.h,
      indicatorBackgroundColor: ColorApp.strokeBlue,
      children: images.map((url) {
        return CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.contain,
          placeholder: (_, __) =>
              Center(
            child: CircularProgressIndicator(
              strokeWidth: 1.8,
              color: ColorApp.gray,
            ),
          ),
          errorWidget: (_, __, ___) =>
          const Icon(Icons.error),
        );
      }).toList(),
    );
  }
}
