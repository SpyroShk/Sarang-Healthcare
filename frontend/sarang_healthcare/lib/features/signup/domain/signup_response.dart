import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_response.freezed.dart';

@freezed
class SignupResponse with _$SignupResponse {
  const factory SignupResponse.non_field_errors() = _Non_field_errors;
  const factory SignupResponse.password1() = _Password1;
  const factory SignupResponse.username() = _Username;
  const factory SignupResponse.key() = _Key;
}
