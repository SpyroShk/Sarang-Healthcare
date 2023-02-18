import '../../domain/doc_appointment_detail.dart';
import 'doc_appointment_detail_dto.dart';

class DocAppointmentMapper {
  static DocAppointmentDetailDto toDto(
          DocAppointmentDetail docAppointmentDetail) =>
      DocAppointmentDetailDto(
        userId: docAppointmentDetail.userId,
        username: docAppointmentDetail.username,
        doctorName: docAppointmentDetail.doctorName,
        doctorId: docAppointmentDetail.doctorId,
        appointmentDate: docAppointmentDetail.appointmentDate,
        appointmentTime: docAppointmentDetail.appointmentTime,
        contact: docAppointmentDetail.contact,
        patientName: docAppointmentDetail.patientName,
        age: docAppointmentDetail.age,
        gender: docAppointmentDetail.gender,
        userPatientRelation: docAppointmentDetail.userPatientRelation,
      );
}
