import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sarang_healthcare/core/presentation/sarang_app.dart';
import 'package:sarang_healthcare/features/appointment_list/application/cubit/appointment_list_cubit.dart';
import 'package:sarang_healthcare/features/doc_appointment/presentation/doc_appointment.dart';
import 'package:sarang_healthcare/features/profile/infrastructure/dtos/user_detail_dto.dart';
import 'package:sarang_healthcare/features/signup/application/cubit/signup_cubit.dart';
import 'core/shared/get_it.dart';
import 'features/doc_appointment/application/cubit/doc_appointment_cubit.dart';
import 'features/login/application/cubit/login_cubit.dart';
import 'features/preferred_doctor/application/cubit/preferred_doctor_cubit.dart';
import 'features/profile/application/cubit/profile_cubit.dart';
import 'features/profile/infrastructure/profile_repository.dart';

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
          value: getIt.get<ProfileCubit>(),
        ),
        BlocProvider.value(
          value: getIt.get<PreferredDoctorCubit>(),
        ),
        BlocProvider.value(
          value: getIt.get<DocAppointmentCubit>(),
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
}
