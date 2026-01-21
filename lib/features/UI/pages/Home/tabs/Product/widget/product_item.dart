import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Domain/entities/response/product/product_data.dart';
import 'package:e_commerce/core/Utils/assets_app.dart';
import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:e_commerce/core/Utils/text_app.dart';
import 'package:flutter/material.dart';
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
                        // todo: add product
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
