import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_failure.freezed.dart';

@freezed
class ChangePasswordFailure with _$ChangePasswordFailure {
  const factory ChangePasswordFailure.server() = _Server;
  const factory ChangePasswordFailure.storage() = _Storage;
  const factory ChangePasswordFailure.network() = _Network;
  const factory ChangePasswordFailure.client({required String message}) = _Client;
}
