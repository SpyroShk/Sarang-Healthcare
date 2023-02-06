import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_failure.freezed.dart';

@freezed
class LoginFailure with _$LoginFailure {
  const factory LoginFailure.server() = _Server;
  const factory LoginFailure.storage() = _Storage;
  const factory LoginFailure.network() = _Network;
  const factory LoginFailure.client({required String message}) = _Client;
}
