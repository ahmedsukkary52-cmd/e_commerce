import 'package:e_commerce/config/di.dart';
import 'package:e_commerce/core/Utils/assets_app.dart';
import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:e_commerce/core/Utils/dialog_utils.dart';
import 'package:e_commerce/core/Utils/routes_App.dart';
import 'package:e_commerce/core/Utils/text_app.dart';
import 'package:e_commerce/core/Utils/validators_app.dart';
import 'package:e_commerce/features/UI/Auth/Login/cubit/login_view_model.dart';
import 'package:e_commerce/features/UI/Auth/auth_states.dart';
import 'package:e_commerce/features/UI/widgets/custom_elevatedButton.dart';
import 'package:e_commerce/features/UI/widgets/custom_textFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController(
      text: 'ahmedmuttii4012@gmail.com'
  );
  final TextEditingController password = TextEditingController(
      text: 'Ahmed@123'
  );

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  LoginViewModel viewModel = getIt<LoginViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, AuthStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is AuthLoadingState) {
          DialogUtils.showLoading(context: context);
        } else if (state is AuthErrorState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
              title: 'Error',
              context: context,
              message: state.errorMessage,
              posActionName: 'ok'
          );
        } else if (state is AuthSuccessState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
              context: context,
              title: 'Success',
              message: "Login Successfully",
              posActionName: 'ok',
              posActionFunction: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, RoutesApp.homeScreen);
              }
          );
        }
      },
      child: Scaffold(
        backgroundColor: ColorApp.primaryBlue,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 90.h, right: 16.w, left: 16.w),
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        AssetsApp.routeLogoDesign,
                        width: 237.w,
                      ),
                    ),
                    SizedBox(height: 86.h),
                    Text(
                      "Welcome Back To Route",
                      style: TextApp.semiBold24White,
                    ),
                    Text(
                      "Please sign in with your mail",
                      style: TextApp.light16white,
                    ),
                    SizedBox(height: 40.h),
                    Text("User Name", style: TextApp.medium18White),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      hintText: 'Enter your name',
                      controller: email,
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
                      onPressed: () =>
                          viewModel.login(
                              email: email.text, password: password.text),
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
      ),
    );
  }

  void createAccount(BuildContext context) {
    Navigator.pushReplacementNamed(context, RoutesApp.register);
  }
}
