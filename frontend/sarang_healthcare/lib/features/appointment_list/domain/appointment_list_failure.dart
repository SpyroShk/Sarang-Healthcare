import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_list_failure.freezed.dart';

@freezed
class AppointmentListFailure with _$AppointmentListFailure {
  const factory AppointmentListFailure.server() = _Server;
  const factory AppointmentListFailure.storage() = _Storage;
  const factory AppointmentListFailure.network() = _Network;
  const factory AppointmentListFailure.client({required String message}) =
      _Client;
}
