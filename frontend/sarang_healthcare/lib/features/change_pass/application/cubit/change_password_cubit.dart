import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/change_password_model.dart';
import '../../infrastructure/change_password_repository.dart';

part 'change_password_state.dart';
part 'change_password_cubit.freezed.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(
      {required ChangePasswordRepository changePasswordRepository})
      : _changePasswordRepository = changePasswordRepository,
        super(const ChangePasswordState.initial());
  final ChangePasswordRepository _changePasswordRepository;

  void changePassword({
    // ignore: non_constant_identifier_names
    required String old_password,
    // ignore: non_constant_identifier_names
    required String new_password1,
    // ignore: non_constant_identifier_names
    required String new_password2,
  }) async {
    emit(const ChangePasswordState.loading());

    final changePasswordModel = ChangePasswordModel(
      old_password: old_password,
      new_password1: new_password1,
      new_password2: new_password2,
    );
    final response = await _changePasswordRepository.changePassword(
        changePasswordModel: changePasswordModel);

    response.fold(
      (changePasswordFailure) {
        String message = "";

        changePasswordFailure.when(
          server: () =>
              message = "Server error occured. Please try again later.",
          storage: () => message = "Internal error occured.",
          network: () => message = "Network error occured.",
          client: (errMsg) => message = errMsg,
        );
        emit(ChangePasswordState.unsucceeded(message: message));
      },
      (_) {
        emit(
          const ChangePasswordState.succeeded(
              message: "Password Changed sucessfully."),
        );
      },
    );
  }
}
