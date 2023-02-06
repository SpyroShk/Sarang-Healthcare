import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../../features/login/application/cubit/login_cubit.dart';
import '../../features/login/infrastructure/login_repository.dart';
import '../../features/profile/application/cubit/profile_cubit.dart';
import '../../features/profile/infrastructure/local_storage/user_detail_storage.dart';
import '../../features/profile/infrastructure/profile_repository.dart';
import '../../features/signup/application/cubit/signup_cubit.dart';
import '../../features/signup/infrastructure/signup_repository.dart';
import '../infrastructure/secure_credential_storage.dart';
import '../presentation/route/app_router.dart';

final getIt = GetIt.instance;

void setupLocators() {
  getIt.registerSingleton<Dio>(
    Dio(),
  );

  getIt.registerSingleton<SecureCredentialStorage>(
    SecureCredentialStorage(
      const FlutterSecureStorage(),
    ),
  );

  getIt.registerSingleton<UserDetailStorage>(
    UserDetailStorage(),
  );

  getIt.registerSingleton<LoginRepository>(
    LoginRepository(
      dio: getIt.get<Dio>(),
      secureCredentialStorage: getIt.get<SecureCredentialStorage>(),
    ),
  );

  getIt.registerLazySingleton<LoginCubit>(
    () => LoginCubit(
      loginRepository: getIt.get<LoginRepository>(),
    ),
  );

  getIt.registerSingleton<SignupRepository>(
    SignupRepository(
      dio: getIt.get<Dio>(),
      secureCredentialStorage: getIt.get<SecureCredentialStorage>(),
    ),
  );

  getIt.registerLazySingleton<SignupCubit>(
    () => SignupCubit(
      signupRepository: getIt.get<SignupRepository>(),
    ),
  );

  getIt.registerLazySingleton<AppRouter>(
    () => AppRouter(
      loginCubit: getIt.get<LoginCubit>(),
    ),
  );

  getIt.registerSingleton<ProfileRepository>(
    ProfileRepository(
      dio: getIt.get<Dio>(),
      secureCredentialStorage: getIt.get<SecureCredentialStorage>(),
      userDetailStorage: getIt.get<UserDetailStorage>(),
    ),
  );

  getIt.registerSingleton<ProfileCubit>(
    ProfileCubit(
      profileRepository: getIt.get<ProfileRepository>(),
    ),
  );
}
