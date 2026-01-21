import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:e_commerce/core/Utils/text_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainLoadingWidget extends StatelessWidget {
  const MainLoadingWidget({super.key, this.loadingMessage});

  final String? loadingMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: loadingMessage != null
          ? Container(
              decoration: BoxDecoration(
                color: ColorApp.primaryBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20.w,
                children: [
                  Text(loadingMessage!, style: TextApp.medium18White),
                  SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      color: ColorApp.primaryWhite,
                      strokeWidth: 2,
                    ),
                  ),
                ],
              ),
            )
          : CircularProgressIndicator(),
    );
  }
}
