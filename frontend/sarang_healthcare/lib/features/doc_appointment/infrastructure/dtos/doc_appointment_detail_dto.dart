import 'package:freezed_annotation/freezed_annotation.dart';

part 'doc_appointment_detail_dto.freezed.dart';
part 'doc_appointment_detail_dto.g.dart';

@freezed
class DocAppointmentDetailDto with _$DocAppointmentDetailDto {
  const factory DocAppointmentDetailDto({
    required String userId,
    required String username,
    required String doctorName,
    required int doctorId,
    required DateTime appointmentDate,
    required DateTime appointmentTime,
    required int contact,
    required String patientName,
    required int age,
    required String gender,
    required String userPatientRelation,
  }) = _DocAppointmentDetailDto;

  factory DocAppointmentDetailDto.fromJson(Map<String, dynamic> json) =>
      _$DocAppointmentDetailDtoFromJson(json);
}
