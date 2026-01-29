import 'package:dio/dio.dart';
import 'package:e_commerce/Domain/entities/request/auth_request/login_request.dart';
import 'package:e_commerce/Domain/use_cases/auth_use_case/login_use_case.dart';
import 'package:e_commerce/core/Exceptions/exceptions_app.dart';
import 'package:e_commerce/features/UI/Auth/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<AuthStates> {
  LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase}) : super(AuthLoadingState());

  var formKey = GlobalKey<FormState>();

  void login({required String email, required String password}) async {
    try {
      if (formKey.currentState?.validate() == true) {
        emit(AuthLoadingState());
        LoginRequest loginRequest = LoginRequest(
          email: email,
          password: password,
        );
        var authResponse = await loginUseCase.invoke(loginRequest);

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
