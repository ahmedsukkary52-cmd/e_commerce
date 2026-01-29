import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:e_commerce/core/Utils/text_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Domain/entities/response/brand/brand_data.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({super.key, required this.brand});

  final Data brand;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: CachedNetworkImage(
            width: double.infinity,
            height: 20.h,
            fit: BoxFit.cover,
            imageUrl: brand.image ?? '',
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: imageProvider),
                ),
              );
            },
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
                strokeWidth: 1.8,
                color: ColorApp.gray,
              ),
            ),
            errorWidget: (context, url, error) =>
                Center(child: Icon(Icons.error, color: ColorApp.redColor)),
          ),
        ),
        SizedBox(height: 8.h),
        Expanded(
          flex: 4,
          child: Text(
            brand.name ?? '',
            textWidthBasis: TextWidthBasis.longestLine,
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextApp.regular14DarkBlue,
          ),
        ),
      ],
    );
  }
}
