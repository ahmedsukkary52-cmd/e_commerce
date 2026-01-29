import 'package:dio/dio.dart';
import 'package:e_commerce/Domain/use_cases/auth_use_case/register_use_case.dart';
import 'package:e_commerce/core/Exceptions/exceptions_app.dart';
import 'package:e_commerce/features/UI/Auth/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../Domain/entities/request/auth_request/register_request.dart';

@injectable
class RegisterViewModel extends Cubit<AuthStates> {
  RegisterUseCase registerUseCase;

  RegisterViewModel({required this.registerUseCase})
    : super(AuthLoadingState());

  var formKey = GlobalKey<FormState>();

  void register({
    required String email,
    required String password,
    required String rePassword,
    required String name,
    required String phone,
  }) async {
    try {
      if (formKey.currentState?.validate() == true) {
        emit(AuthLoadingState());
        RegisterRequest registerRequest = RegisterRequest(
          email: email,
          password: password,
          rePassword: rePassword,
          phone: phone,
          name: name,
        );
        var authResponse = await registerUseCase.invoke(registerRequest);
        emit(AuthSuccessState(authResponse: authResponse));
      }
    } on ExceptionsApp catch (e) {
      emit(AuthErrorState(errorMessage: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is ExceptionsApp)
          ? (e.error as ExceptionsApp).errorMessage
          : 'UnExpected Error Occurred';
      emit(AuthErrorState(errorMessage: message));
    }
  }
}
