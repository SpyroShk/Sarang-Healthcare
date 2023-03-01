
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/infrastructure/secure_credential_storage.dart';
import '../../../core/shared/api_constants.dart';
import '../domain/lab_testing_list_failure.dart';
import '../domain/lab_testing_list_model.dart';
import '../domain/lab_testing_list_success.dart';
import 'dtos/lab_testing_list_dto.dart';
import 'dtos/lab_testing_list_mapper.dart';

class LabTestingListRepository {
  final Dio _dio;
  final SecureCredentialStorage _secureCredentialStorage;

  LabTestingListRepository({
    required Dio dio,
    required SecureCredentialStorage secureCredentialStorage,
  }) : _dio = dio,
        _secureCredentialStorage = secureCredentialStorage;

  Future<Either<LabTestingListFailure, LabTestingListSuccess>>
      labTestingList() async {
    final userId = await _secureCredentialStorage.getUserId();
    String url = "${ApiConstants.baseUrl}/labtestingappointments/labtestinglist?id=$userId";
    try {
      final response = await _dio.get(url);
      final respData = response.data;
      List<LabTestingListModel> listOfAppointments = [];
      for (final docs in respData) {
        final dto = LabTestingListDto.fromJson(docs);
        final detail = LabTestingListMapper.toLabTestingListDetail(dto);
        listOfAppointments.add(detail);
      }
      return Right(
        LabTestingListSuccess.network(apiData: listOfAppointments),
      );
    } on DioError catch (e) {
      return Left(
        failure(e),
      );
    }
  }

  Future<Either<LabTestingListFailure, LabTestingListSuccess>>
      labTestingListWithoutId() async {
    String url = "${ApiConstants.baseUrl}/labtestingappointments/labtestinglist";
    try {
      final response = await _dio.get(url);
      final respData = response.data;
      List<LabTestingListModel> listOfAppointments = [];
      for (final docs in respData) {
        final dto = LabTestingListDto.fromJson(docs);
        final detail = LabTestingListMapper.toLabTestingListDetail(dto);
        listOfAppointments.add(detail);
      }
      return Right(
        LabTestingListSuccess.network(apiData: listOfAppointments),
      );
    } on DioError catch (e) {
      return Left(
        failure(e),
      );
    }
  }

  LabTestingListFailure failure(DioError error) {
    final statusCode = error.response?.statusCode ?? 0;
    if (statusCode == 401) {
      return const LabTestingListFailure.client(
        message: 'Error',
      );
    } else if (statusCode > 500) {
      return const LabTestingListFailure.server();
    }
    return const LabTestingListFailure.network();
  }
}
