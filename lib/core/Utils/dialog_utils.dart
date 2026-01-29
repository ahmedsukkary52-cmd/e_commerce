import 'package:e_commerce/core/Utils/text_app.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading({required BuildContext context}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            SizedBox(width: 30),
            Text('Loading...', style: TextApp.medium18Blue),
          ],
        ),
      ),
    );
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    String? title,
    String? posActionName,
    Function? posActionFunction,
    String? negActionName,
    Function? negActionFunction,
  }) {
    List<Widget>? actions = [];
    if (posActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            posActionFunction?.call();
          },
          child: Text(posActionName, style: TextApp.medium20DarkBlue),
        ),
      );
    }
    if (negActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            negActionFunction?.call();
          },
          child: Text(negActionName, style: TextApp.medium18Red),
        ),
      );
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title ?? '', style: TextApp.semiBold24Blue),
        content: Text(message, style: TextApp.medium18Blue),
        actions: actions,
      ),
    );
  }
}
