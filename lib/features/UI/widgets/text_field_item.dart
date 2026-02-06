import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:e_commerce/core/Utils/text_app.dart';
import 'package:e_commerce/features/UI/widgets/custom_textFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/Utils/assets_app.dart';

class TextFieldItem extends StatelessWidget {
  const TextFieldItem({
    super.key,
    required this.text,
    required this.controller,
    this.val,
  });

  final String text;
  final TextEditingController controller;
  final String? Function(String?)? val;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: TextApp.medium18DarkBlue),
        SizedBox(height: 16.h),
        CustomTextField(
          validator: val,
          hintText: text,
          hintTextStyle: TextApp.medium14DarkBlue,
          enableBorderColor: ColorApp.strokeBlue,
          focusBorderColor: ColorApp.primaryBlue,
          suffixIcon: Padding(
            padding: EdgeInsets.all(8.0.h),
            child: SvgPicture.asset(AssetsApp.edit),
          ),
          controller: controller,
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
