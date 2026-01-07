import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/Utils/color_app.dart';
import '../../../core/Utils/text_app.dart';

enum AppButtonVariant { large, small }

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = AppButtonVariant.large,
    this.icon,
  });

  final String text;
  final VoidCallback onPressed;
  final AppButtonVariant variant;
  final IconData? icon;

  bool get _isLarge => variant == AppButtonVariant.large;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: _isLarge ? 60.h : 48.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: _isLarge
              ? ColorApp.primaryWhite
              : ColorApp.primaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_isLarge ? 15 : 20),
          ),
        ),
        child: _isLarge ? _buildLargeContent() : _buildSmallContent(),
      ),
    );
  }

  Widget _buildLargeContent() {
    return Text(text, style: TextApp.semiBold20Blue);
  }

  Widget _buildSmallContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon ?? Icons.add, color: ColorApp.primaryWhite, size: 18),
        SizedBox(width: 24.w),
        Text(text, style: TextApp.medium18White),
      ],
    );
  }
}
