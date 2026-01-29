import 'package:e_commerce/core/Utils/assets_app.dart';
import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LikeWidget extends StatelessWidget {
  LikeWidget({super.key, required this.isLike, required this.onTap});

  bool isLike;

  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: ColorApp.transparent,
      onTap: onTap,
      child: Container(
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
        child: SvgPicture.asset(isLike ? AssetsApp.likeS : AssetsApp.like),
      ),
    );
  }
}
