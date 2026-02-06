import 'package:e_commerce/core/Utils/routes_App.dart';
import 'package:e_commerce/core/Utils/text_app.dart';
import 'package:e_commerce/core/Utils/validators_app.dart';
import 'package:e_commerce/core/cache/shared_prefs_utils.dart';
import 'package:e_commerce/features/UI/widgets/button_item_widget.dart';
import 'package:e_commerce/features/UI/widgets/text_field_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    super.initState();
    _loadCachedBillingData();
  }

  Future<void> _loadCachedBillingData() async {
    final billingData = await SharedPrefsUtils.getCachedBillingData();

    setState(() {
      firstNameController.text = billingData.firstName;
      lastNameController.text = billingData.lastName;
      emailController.text = billingData.email;
      phoneController.text = billingData.phoneNumber;
    });
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment', style: TextApp.medium20DarkBlue)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                "Please fill the fields and review them carefully",
                style: TextApp.medium18DarkBlue,
              ),
              SizedBox(height: 20.h),
              TextFieldItem(
                text: 'Your First Name',
                controller: firstNameController,
              ),
              TextFieldItem(
                text: 'Your Last Name',
                controller: lastNameController,
              ),
              TextFieldItem(
                text: 'Your E-mail',
                controller: emailController,
                val: ValidatorsApp.validateEmail,
              ),
              TextFieldItem(
                text: 'Your Phone Number',
                controller: phoneController,
                val: ValidatorsApp.validatePhoneNumber,
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  _onTap(context);
                },
                child: ButtonItem(
                  text: "Let's go",
                  icon: Icons.arrow_forward_ios_rounded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context) async {
    if (_formKey.currentState?.validate() == true) {
      await SharedPrefsUtils.saveBillingData(
        firstNameValue: firstNameController.text,
        lastNameValue: lastNameController.text,
        emailValue: emailController.text,
        phoneValue: phoneController.text,
      );

      final billingData = await SharedPrefsUtils.getCachedBillingData();

      Navigator.pushNamed(
        context,
        RoutesApp.choosePaymentMethodScreen,
        arguments: billingData,
      );
    }
  }
}
