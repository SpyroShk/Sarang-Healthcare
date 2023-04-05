import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/infrastructure/secure_credential_storage.dart';
import '../../../core/shared/api_constants.dart';
import '../domain/appointment_list_failure.dart';
import '../domain/appointment_list_model.dart';
import '../domain/appointment_list_success.dart';
import 'dtos/appointment_list_dto.dart';
import 'dtos/appointment_list_mapper.dart';

class AppointmentListRepository {
  final Dio _dio;
  final SecureCredentialStorage _secureCredentialStorage;

  AppointmentListRepository({
    required Dio dio,
    required SecureCredentialStorage secureCredentialStorage,
  })  : _dio = dio,
        _secureCredentialStorage = secureCredentialStorage;

  Future<Either<AppointmentListFailure, AppointmentListSuccess>>
      appointmentList() async {
    final userId = await _secureCredentialStorage.getUserId();
    String url =
        "${ApiConstants.baseUrl}/appointments/appointmentlist?id=$userId";
    try {
      final response = await _dio.get(url);
      final respData = response.data;
      List<AppointmentListModel> listOfAppointments = [];
      for (final docs in respData) {
        final dto = AppointmentListDto.fromJson(docs);
        final detail = AppointmentListMapper.toAppointmentListDetail(dto);
        listOfAppointments.add(detail);
      }
      return Right(
        AppointmentListSuccess.network(apiData: listOfAppointments),
      );
    } on DioError catch (e) {
      return Left(
        failure(e),
      );
    }
  }

  Future<Either<AppointmentListFailure, AppointmentListSuccess>>
      appointmentListForDoc() async {
    final userId = await _secureCredentialStorage.getUserId();
    String url =
        "${ApiConstants.baseUrl}/appointments/appointmentlist?docid=$userId";
    try {
      final response = await _dio.get(url);
      final respData = response.data;
      List<AppointmentListModel> listOfAppointments = [];
      for (final docs in respData) {
        final dto = AppointmentListDto.fromJson(docs);
        final detail = AppointmentListMapper.toAppointmentListDetail(dto);
        listOfAppointments.add(detail);
      }
      return Right(
        AppointmentListSuccess.network(apiData: listOfAppointments),
      );
    } on DioError catch (e) {
      return Left(
        failure(e),
      );
    }
  }

  Future<Either<AppointmentListFailure, AppointmentListSuccess>>
      appointmentListWithoutId() async {
    String url = "${ApiConstants.baseUrl}/appointments/appointmentlist";
    try {
      final response = await _dio.get(url);
      final respData = response.data;
      List<AppointmentListModel> listOfAppointments = [];
      for (final docs in respData) {
        final dto = AppointmentListDto.fromJson(docs);
        final detail = AppointmentListMapper.toAppointmentListDetail(dto);
        listOfAppointments.add(detail);
      }
      return Right(
        AppointmentListSuccess.network(apiData: listOfAppointments),
      );
    } on DioError catch (e) {
      return Left(
        failure(e),
      );
    }
  }

  AppointmentListFailure failure(DioError error) {
    final statusCode = error.response?.statusCode ?? 0;
    if (statusCode == 401) {
      return const AppointmentListFailure.client(
        message: 'Error',
      );
    } else if (statusCode > 500) {
      return const AppointmentListFailure.server();
    }
    return const AppointmentListFailure.network();
  }
}
