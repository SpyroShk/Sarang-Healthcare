import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/infrastructure/secure_credential_storage.dart';
import '../../../core/shared/api_constants.dart';
import '../domain/signup_detail.dart';
import '../domain/signup_failure.dart';
import 'dtos/signup_mapper.dart';

typedef SignupSuccess = String;

class SignupRepository {
  final Dio _dio;
  SignupRepository({
    required Dio dio,
    required SecureCredentialStorage secureCredentialStorage,
  }) : _dio = dio;

  Future<Either<SignupFailure, SignupSuccess>> signup({
    required SignupDetail signupDetail,
  }) async {
    const String url = "${ApiConstants.baseUrl}/registration/";
    final signupDetailDto = SignupMapper.toDto(signupDetail);
    final data = signupDetailDto.toJson();
    log(data.toString());
    try {
      final response = await _dio.post(
        url,
        data: data,
      );
      response.data;
      return const Right("Account registered successfully.");
    } on DioError catch (e) {
      return Left(
        failure(e),
      );
    }
  }

  SignupFailure failure(DioError error) {
    final respData = error.response?.data;
    final statusCode = error.response?.statusCode ?? 0;
    if (statusCode == 429) {
      return const SignupFailure.client(message: "Too many requests");
    }
    if (statusCode >= 400 && statusCode < 500) {
      return SignupFailure.client(
        message: (respData["username"] ??
                respData["email"] ??
                respData["password1"] ??
                respData["non_field_errors"])
            .toString(),
      );
    } else if (statusCode >= 300 && statusCode < 400) {
      return const SignupFailure.client(
        message: "Something went wrong. Please check your email and try again.",
      );
    } else if (statusCode >= 500) {
      return const SignupFailure.server();
    }
    return const SignupFailure.network();
  }
}
