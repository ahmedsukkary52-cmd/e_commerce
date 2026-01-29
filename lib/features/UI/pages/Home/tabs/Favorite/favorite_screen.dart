import 'package:e_commerce/features/UI/pages/Home/tabs/Favorite/cubit/favorite_states.dart';
import 'package:e_commerce/features/UI/pages/Home/tabs/Favorite/cubit/favorite_view_model.dart';
import 'package:e_commerce/features/UI/pages/Home/tabs/Favorite/widget/favorite_item.dart';
import 'package:e_commerce/features/UI/pages/Home/widget/main_error_widget.dart';
import 'package:e_commerce/features/UI/pages/Home/widget/main_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/Utils/text_app.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteViewModel, FavoriteStates>(
      buildWhen: (_, state) =>
      state is FavoriteListLoadingState ||
          state is FavoriteListSuccessState ||
          state is FavoriteListEmptyState ||
          state is FavoriteListErrorState,
      builder: (context, state) {
        if (state is FavoriteListLoadingState) {
          return const MainLoadingWidget();
        }

        if (state is FavoriteListEmptyState) {
          return Center(
            child: Text(
              'No favorite items yet',
              style: TextApp.medium18DarkBlue,
            ),
          );
        }

        if (state is FavoriteListErrorState) {
          return MainErrorWidget(errorMessage: state.message);
        }

        if (state is FavoriteListSuccessState) {
          return ListView.separated(
            itemCount: state.products.length,
            separatorBuilder: (_, __) => SizedBox(height: 12.h),
            itemBuilder: (context, index) =>
                FavoriteItem(
                  productData: state.products[index],
                ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
