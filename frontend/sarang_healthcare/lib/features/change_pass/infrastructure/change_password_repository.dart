import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/infrastructure/secure_credential_storage.dart';
import '../../../core/shared/api_constants.dart';
import '../domain/change_password_failure.dart';
import '../domain/change_password_model.dart';
import 'dtos/change_password_mapper.dart';

typedef ChangePasswordSuccess = String;

class ChangePasswordRepository {
  final Dio _dio;
  final SecureCredentialStorage _secureCredentialStorage;

  ChangePasswordRepository({
    required Dio dio,
    required SecureCredentialStorage secureCredentialStorage,
  })  : _dio = dio,
        _secureCredentialStorage = secureCredentialStorage;

  Future<Either<ChangePasswordFailure, ChangePasswordSuccess>> changePassword({
    required ChangePasswordModel changePasswordModel,
  }) async {
    final apiToken = await _secureCredentialStorage.getApiToken();
    String url = "${ApiConstants.baseUrl}/accounts/password/change/";
    final changePasswordModelDto =
        ChangePasswordMapper.toDto(changePasswordModel);
    final data = changePasswordModelDto.toJson();
    try {
      final response = await _dio.post(
        url,
        data: data,
        options: Options(
          headers: {"Authorization": "Token $apiToken"},
        ),
      );

      response.data;
      return const Right("Password Changed successfully.");
    } on DioError catch (e) {
      return Left(
        failure(e),
      );
    }
  }

  ChangePasswordFailure failure(DioError error) {
    final respData = error.response?.data;
    final statusCode = error.response?.statusCode ?? 0;
    if (statusCode == 429) {
      return const ChangePasswordFailure.client(message: "Too many requests");
    }
    if (statusCode >= 400 && statusCode < 500) {
      return ChangePasswordFailure.client(
        message: (respData["old_password"] ??
                respData["new_password1"] ??
                respData["new_password1"])
            .toString(),
      );
    } else if (statusCode >= 300 && statusCode < 400) {
      return const ChangePasswordFailure.client(
        message:
            "Something went wrong. Please check all the details and try again.",
      );
    } else if (statusCode >= 500) {
      return const ChangePasswordFailure.server();
    }
    return const ChangePasswordFailure.network();
  }
}
