import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:e_commerce/core/Utils/text_app.dart';
import 'package:e_commerce/features/UI/pages/Home/widget/main_loading_widget.dart';
import 'package:e_commerce/features/UI/pages/payment/cubit/payment_states.dart';
import 'package:e_commerce/features/UI/pages/payment/cubit/payment_view_model.dart';
import 'package:e_commerce/features/UI/widgets/button_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KioskPaymentScreen extends StatelessWidget {
  const KioskPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kiosk Payment', style: TextApp.medium20DarkBlue),
      ),
      body: BlocBuilder<PaymentViewModel, PaymentState>(
        builder: (context, state) {
          if (state is PaymentLoading) {
            return const MainLoadingWidget();
          }

          if (state is PaymentKioskSuccess) {
            return Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorApp.strokeBlue, width: 2),
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 20),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Reference Code', style: TextApp.semiBold24Blue),
                    SizedBox(height: 16.h),
                    Text(
                      state.referenceCode,
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorApp.primaryBlue,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Use this code at the store to complete payment',
                      textAlign: TextAlign.center,
                      style: TextApp.medium18DarkBlue,
                    ),
                    SizedBox(height: 24.h),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Clipboard.setData(
                            ClipboardData(text: state.referenceCode),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Code copied successfully'),
                            ),
                          );
                        },
                        child: const Text('Copy Code'),
                      ),
                    ),

                    SizedBox(height: 12.h),

                    ButtonItem(
                      text: 'Back To Home',
                      icon: Icons.arrow_forward_ios_rounded,
                    ),
                  ],
                ),
              ),
            );
          }

          return Center(
            child: Text(
              'Waiting for payment...',
              style: TextApp.medium18DarkBlue,
            ),
          );
        },
      ),
    );
  }
}
