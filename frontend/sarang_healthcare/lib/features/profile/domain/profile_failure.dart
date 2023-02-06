import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_failure.freezed.dart';

@freezed
class ProfileFailure with _$ProfileFailure {
  const factory ProfileFailure.server() = _Server;
  const factory ProfileFailure.storage() = _Storage;
  const factory ProfileFailure.network() = _Network;
  const factory ProfileFailure.client({required String message}) = _Client;
}
