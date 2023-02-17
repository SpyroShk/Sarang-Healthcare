import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferred_doctor_failure.freezed.dart';

@freezed
class PreferredDoctorFailure with _$PreferredDoctorFailure {
  const factory PreferredDoctorFailure.server() = _Server;
  const factory PreferredDoctorFailure.storage() = _Storage;
  const factory PreferredDoctorFailure.network() = _Network;
  const factory PreferredDoctorFailure.client({required String message}) = _Client;
}
