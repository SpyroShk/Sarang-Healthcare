import '../../domain/appointment_list_model.dart';
import 'appointment_list_dto.dart';

class AppointmentListMapper {
  static AppointmentListModel toAppointmentListDetail(
      AppointmentListDto appointmentListDto) {
    return AppointmentListModel(
      id: appointmentListDto.id,
      userId: appointmentListDto.userId,
      username: appointmentListDto.username,
      doctorName: appointmentListDto.doctorName,
      doctorId: appointmentListDto.doctorId,
      doctorImage: appointmentListDto.doctorImage,
      doctorCategory: appointmentListDto.doctorCategory,
      appointmentDate: appointmentListDto.appointmentDate,
      appointmentTime: appointmentListDto.appointmentTime,
      contact: appointmentListDto.contact,
      patientName: appointmentListDto.patientName,
      age: appointmentListDto.age,
      gender: appointmentListDto.gender,
      userPatientRelation: appointmentListDto.userPatientRelation,
      patientDescription: appointmentListDto.patientDescription,
    );
  }

  static AppointmentListDto toAppointmentListDetailDto(
      AppointmentListModel appointmentListModel) {
    return AppointmentListDto(
      id: appointmentListModel.id,
      userId: appointmentListModel.userId,
      username: appointmentListModel.username,
      doctorName: appointmentListModel.doctorName,
      doctorId: appointmentListModel.doctorId,
      doctorImage: appointmentListModel.doctorImage,
      doctorCategory: appointmentListModel.doctorCategory,
      appointmentDate: appointmentListModel.appointmentDate,
      appointmentTime: appointmentListModel.appointmentTime,
      contact: appointmentListModel.contact,
      patientName: appointmentListModel.patientName,
      age: appointmentListModel.age,
      gender: appointmentListModel.gender,
      userPatientRelation: appointmentListModel.userPatientRelation,
      patientDescription: appointmentListModel.patientDescription,
    );
  }
}
