import 'package:e_commerce/core/Utils/assets_app.dart';
import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:e_commerce/core/Utils/routes_App.dart';
import 'package:e_commerce/core/Utils/text_app.dart';
import 'package:e_commerce/core/Utils/validators_app.dart';
import 'package:e_commerce/features/UI/widgets/custom_elevatedButton.dart';
import 'package:e_commerce/features/UI/widgets/custom_textFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController password = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController emailAddress = TextEditingController();

  @override
  void dispose() {
    password.dispose();
    fullName.dispose();
    mobileNumber.dispose();
    emailAddress.dispose();
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
                  SizedBox(height: 40.h),
                  Text("Full Name", style: TextApp.medium18White),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    hintText: 'Enter your name',
                    controller: fullName,
                    validator: ValidatorsApp.validateFullName,
                  ),
                  SizedBox(height: 30.h),
                  Text("Mobile Number", style: TextApp.medium18White),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    hintText: 'Enter your Mobile Number',
                    controller: mobileNumber,
                    validator: ValidatorsApp.validatePhoneNumber,
                    isNumber: true,
                  ),
                  SizedBox(height: 30.h),
                  Text("E-mail address", style: TextApp.medium18White),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    hintText: 'Enter your email address',
                    controller: emailAddress,
                    validator: ValidatorsApp.validateEmail,
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
                  SizedBox(height: 50.h),
                  AppElevatedButton(
                    text: "Sign up",
                    onPressed: () => signUp(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, RoutesApp.homeScreen);
    }
  }
}
