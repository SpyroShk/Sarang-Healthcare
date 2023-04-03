import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/doc_appointment_detail.dart';
import '../../infrastructure/doc_appointment_repository.dart';

part 'doc_appointment_state.dart';
part 'doc_appointment_cubit.freezed.dart';

class DocAppointmentCubit extends Cubit<DocAppointmentState> {
  DocAppointmentCubit(
      {required DocAppointmentRepository docAppointmentRepository})
      : _docAppointmentRepository = docAppointmentRepository,
        super(const DocAppointmentState.initial());
  final DocAppointmentRepository _docAppointmentRepository;

  void docAppointment({
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
  }) async {
    emit(const DocAppointmentState.loading());

    final docAppointmentDetail = DocAppointmentDetail(
      username: username,
      userId: userId,
      age: age,
      appointmentDate: appointmentDate,
      appointmentTime: appointmentTime,
      contact: contact,
      doctorId: doctorId,
      doctorName: doctorName,
      doctorImage: doctorImage,
      doctorCategory: doctorCategory,
      gender: gender,
      patientName: patientName,
      userPatientRelation: userPatientRelation,
      patientDescription: patientDescription,
    );
    final response = await _docAppointmentRepository.docAppointment(
        docAppointmentDetail: docAppointmentDetail);

    response.fold(
      (docAppointmentFailure) {
        String message = "";

        docAppointmentFailure.when(
          server: () =>
              message = "Server error occured. Please try again later.",
          storage: () => message = "Internal error occured.",
          network: () => message = "Network error occured.",
          client: (errMsg) => message = errMsg,
        );
        emit(DocAppointmentState.unsucceeded(message: message));
      },
      (_) {
        emit(
          const DocAppointmentState.succeeded(
              message: "Appointment booked sucessfully."),
        );
      },
    );
  }

  void clearState() {
    emit(
      const DocAppointmentState.initial(),
    );
  }
}
