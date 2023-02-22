import 'package:freezed_annotation/freezed_annotation.dart'
    show JsonKey, freezed, useResult;

part 'doc_appointment_detail.freezed.dart';

@freezed
class DocAppointmentDetail with _$DocAppointmentDetail {
  const factory DocAppointmentDetail({
    required String userId,
    required String username,
    required String doctorName,
    required int doctorId,
    required String doctorImage,
    required String doctorCategory,
    required String appointmentDate,
    required String appointmentTime,
    required int contact,
    required String patientName,
    required int age,
    required String gender,
    required String userPatientRelation,
    required String patientDescription,
  }) = _DocAppointmentDetail;
}
