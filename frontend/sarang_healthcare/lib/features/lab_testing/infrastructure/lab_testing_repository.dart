import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/shared/api_constants.dart';
import '../domain/lab_testing_detail.dart';
import '../domain/lab_testing_failure.dart';
import 'dtos/lab_testing_mapper.dart';

typedef LabTestingSuccess = String;

class LabTestingRepository {
  final Dio _dio;

  LabTestingRepository({
    required Dio dio,
  }) : _dio = dio;

  Future<Either<LabTestingFailure, LabTestingSuccess>> labTesting({
    required LabTestingDetail labTestingDetail,
  }) async {
    const String url =
        "${ApiConstants.baseUrl}/labtestingappointments/labtestinglist";
    final labTestingDetailDto = LabTestingMapper.toDto(labTestingDetail);
    final data = labTestingDetailDto.toJson();
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

  LabTestingFailure failure(DioError error) {
    final respData = error.response?.data;
    final statusCode = error.response?.statusCode ?? 0;
    if (statusCode == 429) {
      return const LabTestingFailure.client(message: "Too many requests");
    }
    if (statusCode >= 400 && statusCode < 500) {
      return LabTestingFailure.client(
        message: (respData["username"] ??
                respData["testList"] ??
                respData["doctorId"] ??
                respData["collectionDate"] ??
                respData["collectionDate"] ??
                respData["contact"] ??
                respData["patientName"] ??
                respData["age"] ??
                respData["gender"] ??
                respData["userPatientRelation"] ??
                respData["city"] ??
                respData["address"] ??
                respData["landmark"] ??
                respData["non_field_errors"])
            .toString(),
      );
    } else if (statusCode >= 300 && statusCode < 400) {
      return const LabTestingFailure.client(
        message:
            "Something went wrong. Please check all the details and try again.",
      );
    } else if (statusCode >= 500) {
      return const LabTestingFailure.server();
    }
    return const LabTestingFailure.network();
  }
}
