import 'package:e_commerce/Domain/entities/response/category/category.dart';
import 'package:e_commerce/config/di.dart';
import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:e_commerce/core/Utils/text_app.dart';
import 'package:e_commerce/features/UI/pages/Home/tabs/Home_tab/brand_item.dart';
import 'package:e_commerce/features/UI/pages/Home/tabs/Home_tab/category_item.dart';
import 'package:e_commerce/features/UI/pages/Home/tabs/Home_tab/cubit/home_tab_states.dart';
import 'package:e_commerce/features/UI/pages/Home/tabs/Home_tab/cubit/home_tab_view_model.dart';
import 'package:e_commerce/features/UI/pages/Home/widget/main_error_widget.dart';
import 'package:e_commerce/features/UI/pages/Home/widget/main_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getCategories();
    viewModel.getBrands();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            _buildAnnouncement(images: viewModel.imagesList),
            SizedBox(height: 24.h),
            _lineBreak(name: 'Categories'),
            BlocBuilder(
              buildWhen: (previous, current) {
                return current is HomeTabSuccessState ||
                    current is HomeTabLoadingState ||
                    current is HomeTabErrorState;
              },
              bloc: viewModel,
              builder: (context, state) {
                if (state is HomeTabErrorState) {
                  return MainErrorWidget(
                    errorMessage: state.message,
                    onPressed: () {
                      viewModel.getCategories();
                    },
                  );
                } else if (state is HomeTabSuccessState) {
                  return _buildHorizontalGrid(
                    items: state.categoryList ?? [],
                    itemBuilder: (item) => CategoryItem(category: item),
                  );
                } else {
                  return MainLoadingWidget();
                }
              },
            ),
            _lineBreak(name: 'Brands'),
            BlocBuilder(
              buildWhen: (previous, current) {
                return current is BrandSuccessState ||
                    current is BrandLoadingState ||
                    current is BrandErrorState;
              },
              bloc: viewModel,
              builder: (context, state) {
                if (state is BrandErrorState) {
                  return MainErrorWidget(
                    errorMessage: state.message,
                    onPressed: () => viewModel.getBrands(),
                  );
                } else if (state is BrandSuccessState) {
                  return _buildHorizontalGrid(
                    items: state.brandsList ?? [],
                    itemBuilder: (item) => BrandItem(brand: item),
                  );
                } else {
                  return MainLoadingWidget();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  ImageSlideshow _buildAnnouncement({required List<String> images}) {
    return ImageSlideshow(
      indicatorColor: ColorApp.primaryBlue,
      height: 190.h,
      autoPlayInterval: 3000,
      isLoop: true,
      initialPage: 0,
      indicatorRadius: 5,
      indicatorBottomPadding: 15.h,
      indicatorPadding: 8.w,
      indicatorBackgroundColor: ColorApp.primaryWhite,
      children: images.map((url) {
        return Image.asset(url, fit: BoxFit.fill);
      }).toList(),
    );
  }

  Widget _lineBreak({required String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: TextApp.medium18DarkBlue),
        TextButton(
          onPressed: () {
            // todo: navigator to view all
          },
          child: Text('View All', style: TextApp.regular12DarkBlue),
        ),
      ],
    );
  }

  SizedBox _buildHorizontalGrid<T>({
    required List<T> items,
    required Widget Function(T item) itemBuilder,
  }) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 100,
          crossAxisSpacing: 10.h,
          mainAxisSpacing: 10.w,
        ),
        itemBuilder: (context, index) {
          return itemBuilder(items[index]);
        },
      ),
    );
  }
}
