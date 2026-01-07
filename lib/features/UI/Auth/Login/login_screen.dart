import 'package:e_commerce/core/Utils/assets_app.dart';
import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:e_commerce/core/Utils/routes_App.dart';
import 'package:e_commerce/core/Utils/text_app.dart';
import 'package:e_commerce/core/Utils/validators_app.dart';
import 'package:e_commerce/features/UI/widgets/custom_elevatedButton.dart';
import 'package:e_commerce/features/UI/widgets/custom_textFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.primaryBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 90.h, right: 16.w, left: 16.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(AssetsApp.routeLogoDesign, width: 237.w),
                  ),
                  SizedBox(height: 86.h),
                  Text("Welcome Back To Route", style: TextApp.semiBold24White),
                  Text(
                    "Please sign in with your mail",
                    style: TextApp.light16white,
                  ),
                  SizedBox(height: 40.h),
                  Text("User Name", style: TextApp.medium18White),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    hintText: 'Enter your name',
                    controller: userName,
                    validator: ValidatorsApp.validateUserName,
                  ),
                  SizedBox(height: 30.h),
                  Text("Password", style: TextApp.medium18White),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    hintText: 'Enter your password',
                    controller: password,
                    validator: ValidatorsApp.validatePassword,
                    isPassword: true,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // todo: forget password
                        },
                        child: Text(
                          "Forget Password?",
                          style: TextApp.regular18White,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  AppElevatedButton(
                    text: "Login",
                    onPressed: () => login(context),
                  ),
                  SizedBox(height: 16.h),
                  Center(
                    child: TextButton(
                      onPressed: () => createAccount(context),
                      child: Text(
                        "Don't have account? Create One",
                        style: TextApp.medium18White,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void createAccount(BuildContext context) {
    Navigator.pushReplacementNamed(context, RoutesApp.register);
  }

  void login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, RoutesApp.homeScreen);
    }
  }
}
