import 'package:e_commerce/config/di.dart';
import 'package:e_commerce/core/Utils/routes_App.dart';
import 'package:e_commerce/features/UI/pages/Home/tabs/Product/cubit/product_state.dart';
import 'package:e_commerce/features/UI/pages/Home/tabs/Product/cubit/product_view_model.dart';
import 'package:e_commerce/features/UI/pages/Home/tabs/Product/widget/product_item.dart';
import 'package:e_commerce/features/UI/pages/Home/widget/main_error_widget.dart';
import 'package:e_commerce/features/UI/pages/Home/widget/main_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductViewModel viewModel = getIt<ProductViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductViewModel, ProductState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is ProductErrorState) {
          return MainErrorWidget(errorMessage: state.errorMessage);
        } else if (state is ProductSuccessState) {
          return SafeArea(child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h,),
              Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .8.h,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                    ),
                    itemCount: state.productList?.length ?? 0,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // todo: navigator to product details tab
                          Navigator.of(context).pushNamed(
                              RoutesApp.productDetails,
                              arguments: state.productList![index]
                          );
                        },
                        child: ProductItem(productData: state
                            .productList![index]),
                      );
                    },
                  )
              )
            ],
          ));
        } else {
          return MainLoadingWidget();
        }
      },
    );
  }
}
