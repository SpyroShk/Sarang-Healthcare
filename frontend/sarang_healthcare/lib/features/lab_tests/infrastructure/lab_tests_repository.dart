import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/shared/api_constants.dart';
import '../domain/lab_tests_failure.dart';
import '../domain/lab_tests_model.dart';
import '../domain/lab_tests_success.dart';
import 'dtos/lab_tests_dto.dart';
import 'dtos/lab_tests_mapper.dart';

class LabTestsRepository {
  final Dio _dio;

  LabTestsRepository({
    required Dio dio,
  }) : _dio = dio;

  Future<Either<LabTestsFailure, LabTestsSuccess>>
      labTests() async {
    String url = "${ApiConstants.baseUrl}/labtests/labtestslist";
    log(url);
    try {
      final response = await _dio.get(url);
      final respData = response.data;
      List<LabTestsModel> listOfDocs = [];
      for (final docs in respData) {
        final dto = LabTestsDto.fromJson(docs);
        final detail = LabTestsMapper.toLabTestsDetail(dto);
        listOfDocs.add(detail);
      }
      return Right(
        LabTestsSuccess.network(apiData: listOfDocs),
      );
    } on DioError catch (e) {
      return Left(
        failure(e),
      );
    }
  }

  LabTestsFailure failure(DioError error) {
    // final respData = error.response?.data;
    final statusCode = error.response?.statusCode ?? 0;
    if (statusCode == 401) {
      return const LabTestsFailure.client(
        message: 'Error',
      );
    } else if (statusCode > 500) {
      return const LabTestsFailure.server();
    }
    return const LabTestsFailure.network();
  }
}
