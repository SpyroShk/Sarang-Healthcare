import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_failure.freezed.dart';

@freezed
class ContactFailure with _$ContactFailure {
  const factory ContactFailure.server() = _Server;
  const factory ContactFailure.storage() = _Storage;
  const factory ContactFailure.network() = _Network;
  const factory ContactFailure.client({required String message}) = _Client;
}
