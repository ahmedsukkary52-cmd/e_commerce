import 'package:e_commerce/core/Utils/text_app.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/Utils/color_app.dart';

class CardPaymentScreen extends StatefulWidget {
  const CardPaymentScreen({super.key});

  @override
  State<CardPaymentScreen> createState() => _CardPaymentScreenState();
}

class _CardPaymentScreenState extends State<CardPaymentScreen> {
  late final WebViewController controller;
  late String paymentKey;

  static const int iframeId = 1001757;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    paymentKey = ModalRoute.of(context)!.settings.arguments as String;

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(
          'https://accept.paymob.com/api/acceptance/iframes/$iframeId'
          '?payment_token=$paymentKey',
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Payment', style: TextApp.medium20DarkBlue),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
