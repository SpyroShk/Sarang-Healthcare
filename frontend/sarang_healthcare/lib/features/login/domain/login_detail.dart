import 'package:freezed_annotation/freezed_annotation.dart'
    show JsonKey, freezed, useResult;

part 'login_detail.freezed.dart';

@freezed
class LoginDetail with _$LoginDetail {
  const factory LoginDetail({
    required String usernameEmail,
    String? password,
  }) = _LoginDetail;
}


