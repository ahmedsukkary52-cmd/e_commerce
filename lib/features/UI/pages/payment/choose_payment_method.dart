import 'package:e_commerce/api/model/request/payment/billing_data_request_dto.dart';
import 'package:e_commerce/core/Utils/routes_App.dart';
import 'package:e_commerce/features/UI/pages/payment/cubit/payment_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Domain/entities/payment/payment_result.dart';
import '../../../../core/Utils/assets_app.dart';
import '../../../../core/Utils/color_app.dart';
import '../../../../core/Utils/dialog_utils.dart';
import '../../../../core/Utils/text_app.dart';
import '../cart_screen/cubit/cart_view_model.dart';
import 'cubit/payment_view_model.dart';

class ChoosePaymentMethodScreen extends StatefulWidget {
  const ChoosePaymentMethodScreen({super.key});

  @override
  State<ChoosePaymentMethodScreen> createState() =>
      _ChoosePaymentMethodScreenState();
}

class _ChoosePaymentMethodScreenState extends State<ChoosePaymentMethodScreen> {
  PaymentMethod? selectedMethod;

  @override
  Widget build(BuildContext context) {
    final billingData =
        ModalRoute.of(context)!.settings.arguments as BillingData;

    return BlocListener<PaymentViewModel, PaymentState>(
      listener: (context, state) {
        if (state is PaymentCardSuccess) {
          Navigator.pushNamed(
            context,
            RoutesApp.paymentCardScreen,
            arguments: state.paymentKey,
          );
        } else if (state is PaymentKioskSuccess) {
          Navigator.pushNamed(
            context,
            RoutesApp.paymentKioskScreen,
            arguments: state.referenceCode,
          );
        } else if (state is PaymentError) {
          DialogUtils.showMessage(
            context: context,
            message: state.message,
            title: 'Error',
            posActionName: 'OK',
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Payment Methods', style: TextApp.medium20DarkBlue),
        ),
        body: BlocBuilder<PaymentViewModel, PaymentState>(
          builder: (context, state) {
            final isLoading = state is PaymentLoading;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              child: Column(
                spacing: 20.h,
                children: [
                  Text(
                    "Please Choose Payment Method",
                    style: TextApp.medium18DarkBlue,
                  ),

                  Row(
                    children: [
                      _paymentMethods(
                        text: "Pay With Kiosk",
                        image: AssetsApp.kiosk,
                        isSelected: selectedMethod == PaymentMethod.kiosk,
                        isDisabled: isLoading,
                        onTap: () {
                          setState(() => selectedMethod = PaymentMethod.kiosk);

                          PaymentViewModel.get(context).createPayment(
                            amount: CartViewModel.get(context).totalPrice * 100,
                            billingData: billingData,
                            paymentMethod: PaymentMethod.kiosk,
                          );
                        },
                      ),
                      const Spacer(),
                      _paymentMethods(
                        text: "Pay With Card",
                        image: AssetsApp.card,
                        isSelected: selectedMethod == PaymentMethod.card,
                        isDisabled: isLoading,
                        onTap: () {
                          setState(() => selectedMethod = PaymentMethod.card);

                          PaymentViewModel.get(context).createPayment(
                            amount: CartViewModel.get(context).totalPrice * 100,
                            billingData: billingData,
                            paymentMethod: PaymentMethod.card,
                          );
                        },
                      ),
                    ],
                  ),

                  if (isLoading) ...[
                    SizedBox(height: 30.h),
                    const CircularProgressIndicator(),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _paymentMethods({
    required String text,
    required String image,
    required VoidCallback onTap,
    required bool isSelected,
    required bool isDisabled,
  }) {
    return InkWell(
      onTap: isDisabled ? null : onTap,
      child: Opacity(
        opacity: isDisabled ? 0.5 : 1,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 28.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color: isSelected ? ColorApp.primaryBlue : ColorApp.strokeBlue,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Text(text, style: TextApp.medium20DarkBlue),
              SizedBox(height: 50.h),
              Image.asset(image, width: 146.w, height: 95.h),
            ],
          ),
        ),
      ),
    );
  }
}
