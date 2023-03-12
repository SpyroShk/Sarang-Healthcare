import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:sarang_healthcare/features/doc_appointment/infrastructure/doc_appointment_repository.dart';

import '../../features/appointment_list/application/cubit/appointment_list_cubit.dart';
import '../../features/appointment_list/infrastructure/appointment_list_repository.dart';
import '../../features/contact/application/cubit/contact_cubit.dart';
import '../../features/contact/infrastructure/contact_repository.dart';
import '../../features/contact/infrastructure/local_storage/contact_model_storage.dart';
import '../../features/doc_appointment/application/cubit/doc_appointment_cubit.dart';
import '../../features/lab_testing/application/cubit/lab_testing_cubit.dart';
import '../../features/lab_testing/infrastructure/lab_testing_repository.dart';
import '../../features/lab_testing_list/application/cubit/lab_testing_list_cubit.dart';
import '../../features/lab_testing_list/infrastructure/lab_testing_list_repository.dart';
import '../../features/lab_tests/application/cubit/lab_tests_cubit.dart';
import '../../features/lab_tests/infrastructure/lab_tests_repository.dart';
import '../../features/login/application/cubit/login_cubit.dart';
import '../../features/login/infrastructure/login_repository.dart';
import '../../features/preferred_doctor/application/cubit/preferred_doctor_cubit.dart';
import '../../features/preferred_doctor/infrastructure/preferred_doctor_repository.dart';
import '../../features/profile/application/cubit/profile_cubit.dart';
import '../../features/profile/infrastructure/local_storage/user_detail_storage.dart';
import '../../features/profile/infrastructure/profile_repository.dart';
import '../../features/report/application/cubit/report_cubit.dart';
import '../../features/report/infrastructure/report_repository.dart';
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

  getIt.registerSingleton<ContactModelStorage>(
    ContactModelStorage(),
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
    ),
  );

  getIt.registerLazySingleton<SignupCubit>(
    () => SignupCubit(
      signupRepository: getIt.get<SignupRepository>(),
    ),
  );

  getIt.registerSingleton<DocAppointmentRepository>(
    DocAppointmentRepository(
      dio: getIt.get<Dio>(),
    ),
  );

  getIt.registerLazySingleton<DocAppointmentCubit>(
    () => DocAppointmentCubit(
      docAppointmentRepository: getIt.get<DocAppointmentRepository>(),
    ),
  );

  getIt.registerSingleton<AppointmentListRepository>(
    AppointmentListRepository(
      dio: getIt.get<Dio>(),
      secureCredentialStorage: getIt.get<SecureCredentialStorage>(),
    ),
  );

  getIt.registerLazySingleton<AppointmentListCubit>(
    () => AppointmentListCubit(
      appointmentListRepository: getIt.get<AppointmentListRepository>(),
    ),
  );

  getIt.registerSingleton<LabTestingRepository>(
    LabTestingRepository(
      dio: getIt.get<Dio>(),
    ),
  );

  getIt.registerLazySingleton<LabTestingCubit>(
    () => LabTestingCubit(
      labTestingRepository: getIt.get<LabTestingRepository>(),
    ),
  );

  getIt.registerSingleton<LabTestingListRepository>(
    LabTestingListRepository(
      dio: getIt.get<Dio>(),
      secureCredentialStorage: getIt.get<SecureCredentialStorage>(),
    ),
  );

  getIt.registerLazySingleton<LabTestingListCubit>(
    () => LabTestingListCubit(
      labTestingListRepository: getIt.get<LabTestingListRepository>(),
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

  getIt.registerSingleton<PreferredDoctorRepository>(
    PreferredDoctorRepository(
      dio: getIt.get<Dio>(),
    ),
  );

  getIt.registerSingleton<PreferredDoctorCubit>(
    PreferredDoctorCubit(
      preferredDoctorRepository: getIt.get<PreferredDoctorRepository>(),
    ),
  );

  getIt.registerSingleton<LabTestsRepository>(
    LabTestsRepository(
      dio: getIt.get<Dio>(),
    ),
  );

  getIt.registerSingleton<LabTestsCubit>(
    LabTestsCubit(
      labTestsRepository: getIt.get<LabTestsRepository>(),
    ),
  );

  getIt.registerSingleton<ReportRepository>(
    ReportRepository(
      dio: getIt.get<Dio>(),
      secureCredentialStorage: getIt.get<SecureCredentialStorage>(),
    ),
  );

  getIt.registerLazySingleton<ReportCubit>(
    () => ReportCubit(
      reportRepository: getIt.get<ReportRepository>(),
    ),
  );

  getIt.registerSingleton<ContactRepository>(
    ContactRepository(
      dio: getIt.get<Dio>(),
      contactModelStorage: getIt.get<ContactModelStorage>(),
    ),
  );

  getIt.registerSingleton<ContactCubit>(
    ContactCubit(
      contactRepository: getIt.get<ContactRepository>(),
    ),
  );
  
}
