import 'package:flutter/material.dart';

import 'UI/Home/home_screen.dart';
import 'Utils/routes_App.dart';

void main (){
  runApp(const EcommerceApp());
}
class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesApp.homeScreen,
      routes: {
        RoutesApp.homeScreen: (context) => HomeScreen(),
      },
    );
  }
}
