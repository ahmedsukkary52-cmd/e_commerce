import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage {
  static Future<bool?> toastMsg({
    required String message,
    Color? background,
    Color? textColor,
  }) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: background ?? ColorApp.primaryWhite,
      textColor: textColor ?? ColorApp.primaryBlue,
      fontSize: 20,
    );
  }
}
