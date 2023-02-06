import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_failure.freezed.dart';

@freezed
class SignupFailure with _$SignupFailure {
  const factory SignupFailure.server() = _Server;
  const factory SignupFailure.storage() = _Storage;
  const factory SignupFailure.network() = _Network;
  const factory SignupFailure.client({required String message}) = _Client;
}
