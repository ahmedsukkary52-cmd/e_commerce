import 'package:dio/dio.dart';
import 'package:e_commerce/Domain/entities/response/user_profile/add_user/user_profile.dart';
import 'package:e_commerce/core/Exceptions/exceptions_app.dart';
import 'package:e_commerce/features/UI/pages/Home/tabs/User/cubit/user_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../Domain/entities/request/user_request/user_profile_request.dart';
import '../../../../../../../Domain/use_cases/user_profile/add_user_use_case.dart';
import '../../../../../../../Domain/use_cases/user_profile/get_user_use_case.dart';

@injectable
class UserViewModel extends Cubit<UserStates> {
  final AddUserUseCase addUserUseCase;
  final GetUserUseCase getUserUseCase;

  UserProfile? currentUser;

  UserViewModel({required this.addUserUseCase, required this.getUserUseCase})
    : super(UserInitialStates());

  Future<void> addUserAddress(UserProfileRequest request) async {
    try {
      emit(UserLoadingStates());

      final response = await addUserUseCase.invoke(userProfileRequest: request);

      currentUser = response.data?.first;
      emit(UserSuccessStates(userProfileResponse: response));
    } on ExceptionsApp catch (e) {
      emit(UserErrorStates(message: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is ExceptionsApp)
          ? (e.error as ExceptionsApp).errorMessage
          : 'Unexpected error occurred';
      emit(UserErrorStates(message: message));
    }
  }

  Future<void> getUser() async {
    try {
      emit(GetUserLoadingStates());

      var userResponse = await getUserUseCase.invoke();

      if (userResponse.data == null || userResponse.data!.isEmpty) {
        emit(GetUserErrorStates(message: 'No user data found'));
        return;
      }

      currentUser = userResponse.data!.first;
      emit(GetUserSuccessStates(getUserData: userResponse.data!));
    } on DioException catch (e) {
      final message = (e.error is ExceptionsApp)
          ? (e.error as ExceptionsApp).errorMessage
          : 'Unexpected error occurred';
      emit(GetUserErrorStates(message: message));
    }
  }

  void fillControllers({
    required TextEditingController nameController,
    required TextEditingController detailsController,
    required TextEditingController mobileController,
  }) {
    nameController.text = currentUser?.name ?? '';
    mobileController.text = currentUser?.phone ?? '';
  }
}
