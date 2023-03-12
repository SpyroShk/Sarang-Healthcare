import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sarang_healthcare/core/presentation/sarang_app.dart';
import 'package:sarang_healthcare/features/appointment_list/application/cubit/appointment_list_cubit.dart';
import 'package:sarang_healthcare/features/lab_tests/application/cubit/lab_tests_cubit.dart';
import 'package:sarang_healthcare/features/profile/infrastructure/dtos/user_detail_dto.dart';
import 'package:sarang_healthcare/features/report/application/cubit/report_cubit.dart';
import 'package:sarang_healthcare/features/signup/application/cubit/signup_cubit.dart';
import 'core/shared/get_it.dart';
import 'features/contact/application/cubit/contact_cubit.dart';
import 'features/contact/infrastructure/dtos/contact_model_dto.dart';
import 'features/doc_appointment/application/cubit/doc_appointment_cubit.dart';
import 'features/lab_testing/application/cubit/lab_testing_cubit.dart';
import 'features/lab_testing_list/application/cubit/lab_testing_list_cubit.dart';
import 'features/login/application/cubit/login_cubit.dart';
import 'features/preferred_doctor/application/cubit/preferred_doctor_cubit.dart';
import 'features/profile/application/cubit/profile_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocators();
  await Hive.initFlutter();
  registerAdapters();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt.get<LoginCubit>(),
        ),
        BlocProvider.value(
          value: getIt.get<SignupCubit>(),
        ),
        BlocProvider.value(
          value: getIt.get<AppointmentListCubit>(),
        ),
        BlocProvider.value(
          value: getIt.get<LabTestingListCubit>(),
        ),
        BlocProvider.value(
          value: getIt.get<ProfileCubit>(),
        ),
        BlocProvider.value(
          value: getIt.get<PreferredDoctorCubit>(),
        ),
        BlocProvider.value(
          value: getIt.get<DocAppointmentCubit>(),
        ),
        BlocProvider.value(
          value: getIt.get<LabTestsCubit>(),
        ),
        BlocProvider.value(
          value: getIt.get<LabTestingCubit>(),
        ),
        BlocProvider.value(
          value: getIt.get<ReportCubit>(),
        ),
        BlocProvider.value(
          value: getIt.get<ContactCubit>(),
        ),

        // BlocProvider(
        //   create: (context) =>
        //       ProfileCubit(profileRepository: getIt.get<ProfileRepository>())
        //         ..getUserDetails(),
        // ),
      ],
      child: const SarangApp(),
    ),
  );
}

void registerAdapters() {
  Hive.registerAdapter(UserDetailDtoAdapter());
  Hive.registerAdapter(ContactModelDtoAdapter());
}
