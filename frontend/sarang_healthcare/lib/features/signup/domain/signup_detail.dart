import 'package:freezed_annotation/freezed_annotation.dart'
    show JsonKey, freezed, useResult;

part 'signup_detail.freezed.dart';

@freezed
class SignupDetail with _$SignupDetail {
  const factory SignupDetail({
    required String username,
    required String email,
    String? password1,
    String? password2,
  }) = _SignupDetail;
}
