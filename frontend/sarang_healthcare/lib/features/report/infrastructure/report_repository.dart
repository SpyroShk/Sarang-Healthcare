import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/infrastructure/secure_credential_storage.dart';
import '../../../core/shared/api_constants.dart';
import '../domain/report_failure.dart';
import '../domain/report_model.dart';
import '../domain/report_success.dart';
import 'dtos/report_dto.dart';
import 'dtos/report_mapper.dart';

class ReportRepository {
  final Dio _dio;
  final SecureCredentialStorage _secureCredentialStorage;

  ReportRepository({
    required Dio dio,
    required SecureCredentialStorage secureCredentialStorage,
  })  : _dio = dio,
        _secureCredentialStorage = secureCredentialStorage;

  Future<Either<ReportFailure, ReportSuccess>> report() async {
    final userId = await _secureCredentialStorage.getUserId();
    String url = "${ApiConstants.baseUrl}/reports/reportlist?id=$userId";
    try {
      final response = await _dio.get(url);
      final respData = response.data;
      List<ReportModel> listOfReports = [];
      for (final docs in respData) {
        final dto = ReportDto.fromJson(docs);
        final detail = ReportMapper.toReportDetail(dto);
        listOfReports.add(detail);
      }
      return Right(
        ReportSuccess.network(apiData: listOfReports),
      );
    } on DioError catch (e) {
      return Left(
        failure(e),
      );
    }
  }

  ReportFailure failure(DioError error) {
    final statusCode = error.response?.statusCode ?? 0;
    if (statusCode == 401) {
      return const ReportFailure.client(
        message: 'Error',
      );
    } else if (statusCode > 500) {
      return const ReportFailure.server();
    }
    return const ReportFailure.network();
  }
}
