import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/Utils/color_app.dart';
import '../../../core/Utils/text_app.dart';

class ButtonItem extends StatelessWidget {
  const ButtonItem({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorApp.primaryBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextApp.medium20White),
          Icon(icon, color: ColorApp.primaryWhite),
        ],
      ),
    );
  }
}
