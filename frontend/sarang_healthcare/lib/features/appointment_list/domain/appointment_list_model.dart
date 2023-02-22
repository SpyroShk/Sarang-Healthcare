import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_list_model.freezed.dart';

@freezed
class AppointmentListModel with _$AppointmentListModel {
  const factory AppointmentListModel({
    required int id,
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
  }) = _AppointmentListModel;
}
