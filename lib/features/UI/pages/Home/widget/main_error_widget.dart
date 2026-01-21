import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:e_commerce/core/Utils/text_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainErrorWidget extends StatelessWidget {
  const MainErrorWidget({
    super.key,
    required this.errorMessage,
    this.onPressed,
  });

  final String errorMessage;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(errorMessage, style: TextApp.medium18DarkBlue),
          onPressed != null
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                  child: TextButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      alignment: AlignmentGeometry.center,
                      backgroundColor: ColorApp.primaryBlue,
                      elevation: 0,
                      minimumSize: Size(200, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(14.r),
                      ),
                    ),
                    child: Text('Try Again', style: TextApp.medium18White),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
