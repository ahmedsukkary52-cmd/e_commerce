import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:e_commerce/core/Utils/text_app.dart';
import 'package:flutter/material.dart';
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
  int productCounter = 0;
  double totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)!.settings.arguments as ProductData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details', style: TextApp.semiBold20Blue),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AssetsApp.search),
          ),
          IconButton(onPressed: () {}, icon: SvgPicture.asset(AssetsApp.cart)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 16.h,
            bottom: 50.h,
            right: 16.w,
            left: 16.w,
          ),
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
                    _buildImagesSec(images: product.images!),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: () {},
                        icon: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: -10,
                                blurRadius: 24,
                                blurStyle: BlurStyle.normal,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                          child: SvgPicture.asset(AssetsApp.like),
                        ),
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
                    overflow: TextOverflow.ellipsis,
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
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(width: 18.w),
                  SvgPicture.asset(AssetsApp.star),
                  SizedBox(width: 4.w),
                  Text(
                    '${product.ratingsQuantity}(${product.ratingsAverage})',
                    style: TextApp.regular14DarkBlue,
                  ),
                  SizedBox(width: 18.w),
                  _buildCounterSec(product.price?.toDouble() ?? 0),
                ],
              ),
              SizedBox(height: 8.h),
              Text('Description', style: TextApp.medium18DarkBlue),
              SizedBox(height: 8.h),
              ReadMoreText(
                product.description ?? '',
                style: TextApp.medium14DTB,
                trimCollapsedText: ' Read More',
                trimExpandedText: ' Read Less',
                trimLines: 3,
                trimMode: TrimMode.Line,
                colorClickableText: ColorApp.primaryBlue,
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8.h,
                    children: [
                      Text("Total Price", style: TextApp.medium18Gray),
                      Text('EGP $totalPrice', style: TextApp.medium18DarkBlue),
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
                        SvgPicture.asset(AssetsApp.addToCart),
                        Text('Add To Cart', style: TextApp.medium20White),
                        SizedBox(),
                      ],
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

  Widget _buildCounterSec(double price) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: ColorApp.primaryBlue,
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: Row(
        spacing: 12.w,
        children: [
          IconButton(
            onPressed: () {
              if (productCounter > 0) {
                productCounter--;
                totalPrice -= price;
                setState(() {});
              }
            },
            icon: SvgPicture.asset(AssetsApp.minus),
          ),
          Text('$productCounter', style: TextApp.medium18White),
          IconButton(
            onPressed: () {
              productCounter++;
              totalPrice = price * productCounter;
              setState(() {});
            },
            icon: SvgPicture.asset(AssetsApp.plus),
          ),
        ],
      ),
    );
  }

  ImageSlideshow _buildImagesSec({required List<String> images}) {
    return ImageSlideshow(
      indicatorColor: ColorApp.primaryBlue,
      height: 300.h,
      autoPlayInterval: 5000,
      isLoop: true,
      initialPage: 0,
      indicatorRadius: 5,
      indicatorBottomPadding: 15.h,
      indicatorPadding: 8.w,
      indicatorBackgroundColor: ColorApp.strokeBlue,
      children: images.map((url) {
        return CachedNetworkImage(
          imageUrl: url,
          height: 300,
          fit: BoxFit.contain,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(
              strokeWidth: 1.8,
              color: ColorApp.gray,
            ),
          ),
          errorWidget: (context, url, error) =>
              Center(child: Icon(Icons.error, color: ColorApp.redColor)),
        );
      }).toList(),
    );
  }
}
