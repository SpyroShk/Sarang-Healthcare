import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_model.freezed.dart';

@freezed
class ChangePasswordModel with _$ChangePasswordModel {
  const factory ChangePasswordModel({
    required String old_password,
    required String new_password1,
    required String new_password2,
  }) = _ChangePasswordModel;
}
