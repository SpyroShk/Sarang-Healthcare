import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/infrastructure/secure_credential_storage.dart';
import '../../../core/shared/api_constants.dart';
import '../domain/login_detail.dart';
import '../domain/login_failure.dart';
import 'dtos/login_mapper.dart';

typedef LoginSuccess = String;

class LoginRepository {
  final Dio _dio;
  final SecureCredentialStorage _secureCredentialStorage;
  LoginRepository({
    required Dio dio,
    required SecureCredentialStorage secureCredentialStorage,
  })  : _dio = dio,
        _secureCredentialStorage = secureCredentialStorage;

  Future<String?> getToken() async =>
      await _secureCredentialStorage.getApiToken();

  Future<String?> getGroups() async =>
      await _secureCredentialStorage.getGroups();

  Future<String?> getUserId() async =>
      await _secureCredentialStorage.getUserId();

  Future<Either<LoginFailure, LoginSuccess>> login({
    required LoginDetail loginDetail,
  }) async {
    const String url = "${ApiConstants.baseUrl}/login/";
    log(url);
    final loginDetailDto = LoginMapper.toDto(loginDetail);
    final data = loginDetailDto.toJson();
    log(data.toString());
    try {
      final response = await _dio.post(
        url,
        data: data,
      );
      // log(response.toString());
      final respData = response.data;
      if (respData["isStaff"] == true) {
        return const Left(
          LoginFailure.client(
            message: "No Staffs Allowed.",
          ),
        );
      } else {
        await _secureCredentialStorage.setApiToken(respData["key"]);
        await _secureCredentialStorage
            .setGroups(respData["isDoctor"].toString());
        await _secureCredentialStorage.setUserId(respData["userId"].toString());
        log(respData["isDoctor"].toString());
      }
      return const Right("Login successful.");
    } on DioError catch (e) {
      return Left(
        failure(e),
      );
    }
  }

  LoginFailure failure(DioError error) {
    final respData = error.response?.data;
    final statusCode = error.response?.statusCode ?? 0;
    if (statusCode == 429) {
      return const LoginFailure.client(message: "Too many requests");
    }
    if (statusCode >= 400 && statusCode < 500) {
      return LoginFailure.client(
        message: respData["non_field_errors"].toString(),
      );
    } else if (statusCode >= 300 && statusCode < 400) {
      return const LoginFailure.client(
        message: "Something went wrong. Please check your email and try again.",
      );
    } else if (statusCode >= 500) {
      return const LoginFailure.server();
    }
    return const LoginFailure.network();
  }

  Future<String> logOut() async {
    await _secureCredentialStorage.clear();
    return "Logged out successfully.";
  }

  Future<String> getUser() async {
    final email = await _secureCredentialStorage.getUser();
    return email;
  }
}
