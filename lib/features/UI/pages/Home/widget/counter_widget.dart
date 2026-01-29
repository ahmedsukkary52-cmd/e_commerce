import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:e_commerce/core/Utils/text_app.dart';
import '../../../../../core/Utils/assets_app.dart';
import '../../../../../core/Utils/color_app.dart';

class CounterWidget extends StatelessWidget {
  final int counter;
  final VoidCallback onTapIncrement;
  final VoidCallback onTapDecement;

  const CounterWidget({
    super.key,
    required this.counter,
    required this.onTapIncrement,
    required this.onTapDecement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      decoration: BoxDecoration(
        color: ColorApp.primaryBlue,
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: onTapDecement,
            icon: SvgPicture.asset(AssetsApp.minus),
          ),
          Text('$counter', style: TextApp.medium18White),
          IconButton(
            onPressed: onTapIncrement,
            icon: SvgPicture.asset(AssetsApp.plus),
          ),
        ],
      ),
    );
  }
}
