import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/login_detail.dart';
import '../../infrastructure/login_repository.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required LoginRepository loginRepository})
      : _loginRepository = loginRepository,
        super(const LoginState.initial()) {
    //
  }
  final LoginRepository _loginRepository;

  Future<void> checkSignInStatus() async {
    emit(const LoginState.loading());
    final token = await _loginRepository.getToken();
    final group = await _loginRepository.getGroups();
    if (token != null && group == '[]') {
      log('token: $token');
      emit(const LoginState.authenticated());
    } else if (token != null && group == '[Doctors]') {
      log('token: $token');
      log('group: $group');
      emit(const LoginState.docAuthenticated());
    } else {
      emit(const LoginState.unauthenticated(message: "Please sign in"));
    }
  }

  void login({required String usernameEmail, required String password}) async {
    emit(const LoginState.loading());

    final loginDetail =
        LoginDetail(usernameEmail: usernameEmail, password: password);
    final response = await _loginRepository.login(loginDetail: loginDetail);

    response.fold(
      (loginFailure) {
        String message = "";

        loginFailure.when(
          server: () =>
              message = "Server error occured. Please try again later.",
          storage: () => message = "Internal error occured.",
          network: () => message = "Network error occured.",
          client: (errMsg) => message = errMsg,
        );

        emit(LoginState.unauthenticated(message: message));
      },
      (_) async {
        final token = await _loginRepository.getToken();
        final group = await _loginRepository.getGroups();
        if (token != null && group == '[]') {
          log('token: $token');
          emit(const LoginState.authenticated());
        } else if (token != null && group == '[Doctors]') {
          log('token: $token');
          log('group: $group');
          emit(const LoginState.docAuthenticated());
        } else {
          emit(const LoginState.unauthenticated(message: "Please sign in"));
        }
      },
    );
  }

  void logOut() async {
    await _loginRepository.logOut();
    emit(const LoginState.unauthenticated(message: "Please sign in"));
  }

  void getUser(TextEditingController emailController) async {
    final email = await _loginRepository.getUser();
    emailController.text = email;
  }
}
