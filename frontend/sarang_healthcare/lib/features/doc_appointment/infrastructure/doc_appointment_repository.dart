import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/shared/api_constants.dart';
import '../domain/doc_appointment_detail.dart';
import '../domain/doc_appointment_failure.dart';
import 'dtos/doc_appointment_mapper.dart';

typedef DocAppointmentSuccess = String;

class DocAppointmentRepository {
  final Dio _dio;

  DocAppointmentRepository({
    required Dio dio,
  }) : _dio = dio;

  Future<Either<DocAppointmentFailure, DocAppointmentSuccess>> docAppointment({
    required DocAppointmentDetail docAppointmentDetail,
  }) async {
    const String url = "${ApiConstants.baseUrl}/appointments/appointmentlist";
    final docAppointmentDetailDto =
        DocAppointmentMapper.toDto(docAppointmentDetail);
    final data = docAppointmentDetailDto.toJson();
    log(data.toString());
    try {
      final response = await _dio.post(
        url,
        data: data,
      );
      response.data;
      return const Right("Appointment booked successfully.");
    } on DioError catch (e) {
      return Left(
        failure(e),
      );
    }
  }

  DocAppointmentFailure failure(DioError error) {
    final respData = error.response?.data;
    final statusCode = error.response?.statusCode ?? 0;
    if (statusCode == 429) {
      return const DocAppointmentFailure.client(message: "Too many requests");
    }
    if (statusCode >= 400 && statusCode < 500) {
      return DocAppointmentFailure.client(
        message: (respData["username"] ??
                respData["doctor_name"] ??
                respData["doctor_id"] ??
                respData["appointment_date"] ??
                respData["appointment_time"] ??
                respData["contact"] ??
                respData["patient_name"] ??
                respData["age"] ??
                respData["gender"] ??
                respData["user_patient_relation"] ??
                respData["non_field_errors"])
            .toString(),
      );
    } else if (statusCode >= 300 && statusCode < 400) {
      return const DocAppointmentFailure.client(
        message:
            "Something went wrong. Please check all the details and try again.",
      );
    } else if (statusCode >= 500) {
      return const DocAppointmentFailure.server();
    }
    return const DocAppointmentFailure.network();
  }
}
