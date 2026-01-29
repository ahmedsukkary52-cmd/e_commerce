import 'package:e_commerce/core/Utils/assets_app.dart';
import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:e_commerce/core/Utils/dialog_utils.dart';
import 'package:e_commerce/core/Utils/routes_App.dart';
import 'package:e_commerce/core/Utils/text_app.dart';
import 'package:e_commerce/core/cache/shared_prefs_utils.dart';
import 'package:e_commerce/features/UI/pages/Home/tabs/User/cubit/user_states.dart';
import 'package:e_commerce/features/UI/pages/Home/tabs/User/cubit/user_view_model.dart';
import 'package:e_commerce/features/UI/widgets/custom_textFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController mobile = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<UserViewModel>().getUser();
    _initUserData();
  }

  Future<void> _initUserData() async {
    email.text = await SharedPrefsUtils.getData(key: 'email') ?? '';
    password.text = await SharedPrefsUtils.getData(key: 'password') ?? '';
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserViewModel, UserStates>(
      listener: (context, state) {
        if (state is UserSuccessStates) {
          DialogUtils.showMessage(
            context: context,
            message: 'Address Added Successfully',
            posActionName: 'OK',
          );
          final user = context
              .read<UserViewModel>()
              .currentUser;
          name.text = user?.name ?? '';
          mobile.text = user?.phone ?? '';
        }

        if (state is UserErrorStates) {
          DialogUtils.showMessage(
            context: context,
            message: state.message,
            posActionName: 'OK',
          );
        }

        if (state is GetUserSuccessStates) {
          final user = context
              .read<UserViewModel>()
              .currentUser;
          name.text = user?.name ?? '';
          mobile.text = user?.phone ?? '';
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Welcome, ${name.text}", style: TextApp.medium18DarkBlue),
                  SizedBox(height: 8.h),
                  Text(email.text, style: TextApp.medium14DTB),
                  SizedBox(height: 40.h),

                  _textFieldItem(text: 'Your Full Name', controller: name),
                  _textFieldItemReadOnly(
                      text: 'Your E-mail', controller: email),
                  _textFieldItemReadOnly(text: 'Your Password',
                      controller: password,
                      obscureText: true),
                  _textFieldItem(
                      text: 'Your mobile number', controller: mobile),

                  SizedBox(height: 24.h),
                  InkWell(
                    onTap: () {
                      DialogUtils.showMessage(
                        context: context,
                        message: "Are You Sure To Logout",
                        title: 'Warning',
                        posActionName: 'Yes',
                        posActionFunction: () {
                          SharedPrefsUtils.removeData(key: 'token');
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            RoutesApp.login,
                                (route) => false,
                          );
                        },
                        negActionName: 'NO',
                        negActionFunction: () {
                          Navigator.pop(context);
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 18.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: ColorApp.primaryBlue,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Logout', style: TextApp.medium20White),
                          Icon(Icons.logout, color: ColorApp.primaryWhite),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _textFieldItem({
    required String text,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: TextApp.medium18DarkBlue),
        SizedBox(height: 16.h),
        CustomTextField(
          hintText: text,
          hintTextStyle: TextApp.medium14DarkBlue,
          enableBorderColor: ColorApp.strokeBlue,
          focusBorderColor: ColorApp.primaryBlue,
          suffixIcon: Padding(
            padding: EdgeInsets.all(8.0.h),
            child: SvgPicture.asset(AssetsApp.edit),
          ),
          controller: controller,
        ),
        SizedBox(height: 24.h),
      ],
    );
  }

  Widget _textFieldItemReadOnly({
    required String text,
    required TextEditingController controller,
    bool? obscureText,

  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: TextApp.medium18DarkBlue),
        SizedBox(height: 16.h),
        CustomTextField(
            hintText: text,
            obscureText: obscureText ?? false,
            hintTextStyle: TextApp.medium14DarkBlue,
            enableBorderColor: ColorApp.strokeBlue,
            focusBorderColor: ColorApp.primaryBlue,
            controller: controller,
            readOnly: true,
            suffixIcon: Icon(
              Icons.lock_outline_rounded, color: ColorApp.darkBlue,)
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
