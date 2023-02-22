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
  }) = _DocAppointmentDetailDto;

  factory DocAppointmentDetailDto.fromJson(Map<String, dynamic> json) =>
      _$DocAppointmentDetailDtoFromJson(json);
}
