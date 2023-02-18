import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/signup_detail.dart';
import '../../infrastructure/signup_repository.dart';

part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required SignupRepository signupRepository})
      : _signupRepository = signupRepository,
        super(const SignupState.initial()) {}
  final SignupRepository _signupRepository;

  void signup({
    required String username,
    required String email,
    required String password1,
    required String password2,
  }) async {
    emit(const SignupState.loading());

    final signupDetail = SignupDetail(
        username: username,
        email: email,
        password1: password1,
        password2: password2);
    final response = await _signupRepository.signup(signupDetail: signupDetail);

    response.fold(
      (signupFailure) {
        String message = "";

        signupFailure.when(
          server: () =>
              message = "Server error occured. Please try again later.",
          storage: () => message = "Internal error occured.",
          network: () => message = "Network error occured.",
          client: (errMsg) => message = errMsg,
        );
        emit(SignupState.unauthenticated(message: message));
      },
      (_) {
        emit(
          const SignupState.authenticated(message: "Registered sucessfully."),
        );
      },
    );
  }
}
