import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/infrastructure/secure_credential_storage.dart';
import '../../../core/shared/api_constants.dart';
import '../domain/preferred_doctor_failure.dart';
import '../domain/preferred_doctor_model.dart';
import '../domain/preferred_doctor_success.dart';
import 'dtos/preferred_doctor_dto.dart';
import 'dtos/preferred_doctor_mapper.dart';

class PreferredDoctorRepository {
  final Dio _dio;

  PreferredDoctorRepository({
    required Dio dio,
  }) : _dio = dio;

  Future<Either<PreferredDoctorFailure, PreferredDoctorSuccess>>
      preferredDoctor() async {
    String url = "${ApiConstants.baseUrl}/doctor/doctorlist";
    log(url);
    try {
      final response = await _dio.get(url);
      final respData = response.data;
      List<PreferredDoctorModel> listOfDocs = [];
      for (final docs in respData) {
        final dto = PreferredDoctorDto.fromJson(docs);
        final detail = PreferredDoctorMapper.toPreferredDoctorDetail(dto);
        listOfDocs.add(detail);
      }
      return Right(
        PreferredDoctorSuccess.network(apiData: listOfDocs),
      );
    } on DioError catch (e) {
      return Left(
        failure(e),
      );
    }
  }

  PreferredDoctorFailure failure(DioError error) {
    // final respData = error.response?.data;
    final statusCode = error.response?.statusCode ?? 0;
    if (statusCode == 401) {
      return const PreferredDoctorFailure.client(
        message: 'Error',
      );
    } else if (statusCode > 500) {
      return const PreferredDoctorFailure.server();
    }
    return const PreferredDoctorFailure.network();
  }
}
