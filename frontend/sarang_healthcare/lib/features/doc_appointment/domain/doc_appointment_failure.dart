import 'package:freezed_annotation/freezed_annotation.dart';

part 'doc_appointment_failure.freezed.dart';

@freezed
class DocAppointmentFailure with _$DocAppointmentFailure {
  const factory DocAppointmentFailure.server() = _Server;
  const factory DocAppointmentFailure.storage() = _Storage;
  const factory DocAppointmentFailure.network() = _Network;
  const factory DocAppointmentFailure.client({required String message}) = _Client;
}
