import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/infrastructure/secure_credential_storage.dart';
import '../../../core/shared/api_constants.dart';
import '../domain/profile_failure.dart';
import '../domain/profile_success.dart';
import '../domain/user_detail.dart';
import 'dtos/user_detail_dto.dart';
import 'dtos/user_mapper.dart';
import 'local_storage/user_detail_storage.dart';

class ProfileRepository {
  final Dio _dio;
  final SecureCredentialStorage _secureCredentialStorage;
  final UserDetailStorage _userDetailStorage;

  ProfileRepository({
    required Dio dio,
    required SecureCredentialStorage secureCredentialStorage,
    required UserDetailStorage userDetailStorage,
  })  : _dio = dio,
        _secureCredentialStorage = secureCredentialStorage,
        _userDetailStorage = userDetailStorage;

  Future<String?> getToken() async =>
      await _secureCredentialStorage.getApiToken();
  Future<Either<ProfileFailure, ProfileSuccess>> userDetail() async {
    final apiToken = await _secureCredentialStorage.getApiToken();
    String url = "${ApiConstants.baseUrl}/accounts/user/";

    try {
      final response = await _dio.get(url,
          options: Options(
            headers: {"Authorization": "Token $apiToken"},
          ));
      final respData = Map<String, dynamic>.from(response.data);

      final dto = UserDetailDto.fromJson(respData);
      final detail = UserMapper.toUserDetail(dto);
      storeUserDetails(detail);
      return Right(
        ProfileSuccess.network(
          apiData: detail,
        ),
      );
    } on DioError catch (e) {
      final cached = await getCachedDetails();
      if (cached != null) {
        return Right(
          ProfileSuccess.cache(apiData: cached),
        );
      }

      final statusCode = e.response?.statusCode ?? 0;

      if (statusCode == 401) {
        return const Left(
          ProfileFailure.client(
            message: 'Error',
          ),
        );
      } else if (statusCode > 500) {
        return const Left(
          ProfileFailure.server(),
        );
      }
      return const Left(
        ProfileFailure.network(),
      );
    }
  }

  Future<void> storeUserDetails(UserDetail userDetail) async {
    final userDetailDto = UserMapper.toUserDetailDto(userDetail);
    await _userDetailStorage.storeUserDetails(userDetailDto);
  }

  Future<UserDetail?> getCachedDetails() async {
    final userDetailDto = await _userDetailStorage.getUserDetails();
    if (userDetailDto == null) {
      return null;
    }
    final userDetail = UserMapper.toUserDetail(userDetailDto);
    return userDetail;
  }
}
