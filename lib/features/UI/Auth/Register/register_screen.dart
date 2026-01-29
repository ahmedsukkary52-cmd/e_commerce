import 'package:e_commerce/config/di.dart';
import 'package:e_commerce/core/Utils/assets_app.dart';
import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:e_commerce/core/Utils/routes_App.dart';
import 'package:e_commerce/core/Utils/text_app.dart';
import 'package:e_commerce/core/Utils/validators_app.dart';
import 'package:e_commerce/features/UI/Auth/Register/cubit/register_view_model.dart';
import 'package:e_commerce/features/UI/Auth/auth_states.dart';
import 'package:e_commerce/features/UI/widgets/custom_elevatedButton.dart';
import 'package:e_commerce/features/UI/widgets/custom_textFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Utils/dialog_utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController password = TextEditingController(
    text: "Ahmed@2009",
  );
  final TextEditingController rePassword = TextEditingController(
    text: "Ahmed@2009",
  );
  final TextEditingController fullName = TextEditingController(
    text: "Ahmed adel seef",
  );
  final TextEditingController mobileNumber = TextEditingController(
    text: "01080875641",
  );
  final TextEditingController emailAddress = TextEditingController(
    text: "ahmedadel2009@gmail.com",
  );

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    fullName.dispose();
    mobileNumber.dispose();
    emailAddress.dispose();
    super.dispose();
  }

  RegisterViewModel viewModel = getIt<RegisterViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, AuthStates>(
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
            posActionName: 'ok',
          );
        } else if (state is AuthSuccessState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
              context: context,
              title: 'Success',
              message: "Register Successfully",
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
                    SizedBox(height: 40.h),
                    Text("Full Name", style: TextApp.medium18White),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      hintText: 'Enter your name',
                      controller: fullName,
                      validator: ValidatorsApp.validateFullName,
                    ),
                    SizedBox(height: 26.h),
                    Text("Mobile Number", style: TextApp.medium18White),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      hintText: 'Enter your Mobile Number',
                      controller: mobileNumber,
                      validator: ValidatorsApp.validatePhoneNumber,
                      isNumber: true,
                    ),
                    SizedBox(height: 26.h),
                    Text("E-mail address", style: TextApp.medium18White),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      hintText: 'Enter your email address',
                      controller: emailAddress,
                      validator: ValidatorsApp.validateEmail,
                    ),
                    SizedBox(height: 26.h),
                    Text("Password", style: TextApp.medium18White),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      hintText: 'Enter your password',
                      controller: password,
                      validator: ValidatorsApp.validatePassword,
                      isPassword: true,
                    ),
                    SizedBox(height: 26.h),
                    Text("Re-Password", style: TextApp.medium18White),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      hintText: 'Confirm your password',
                      controller: password,
                      validator: (val) {
                        return ValidatorsApp.validateConfirmPassword(
                          val,
                          password.text,
                        );
                      },
                      isPassword: true,
                    ),
                    SizedBox(height: 50.h),
                    AppElevatedButton(
                      text: "Sign up",
                      onPressed: () =>
                          viewModel.register(
                            email: emailAddress.text,
                            password: password.text,
                            rePassword: rePassword.text,
                            name: fullName.text,
                            phone: mobileNumber.text,
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
}
