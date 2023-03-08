import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarang_healthcare/core/presentation/theme/gradient_bg.dart';
import 'package:sarang_healthcare/core/presentation/theme/sizes.dart';
import 'package:sarang_healthcare/core/presentation/widgets/canvas_card.dart';
import 'package:sarang_healthcare/core/presentation/widgets/sarang_appbar.dart';
import 'package:sarang_healthcare/core/shared/context/show_toast.dart';
import 'package:sarang_healthcare/features/profile/application/cubit/profile_cubit.dart';
import 'package:sarang_healthcare/features/profile/domain/user_detail.dart';

import '../../../core/presentation/widgets/sarang_button.dart';
import '../../doc_appointment/application/cubit/doc_appointment_cubit.dart';
import '../../lab_testing/application/cubit/lab_testing_cubit.dart';

class Payment extends StatelessWidget {
  const Payment(
      {super.key,
      this.doctorId,
      this.doctorName,
      required this.appointmentDate,
      required this.appointmentTime,
      required this.contact,
      required this.age,
      required this.gender,
      required this.patientName,
      required this.userPatientRelation,
      this.doctorImage,
      this.doctorCategory,
      this.patientDescription,
      this.testName,
      this.city,
      this.address,
      this.landmark,
      this.service,
      required this.boolValue,
      required this.total});

  final int? doctorId;
  final String? doctorName;
  final String? doctorImage;
  final String? doctorCategory;
  final String appointmentDate;
  final String appointmentTime;
  final int contact;
  final int age;
  final String gender;
  final String patientName;
  final String userPatientRelation;
  final String? patientDescription;
  final String? testName;
  final String? city;
  final String? address;
  final String? landmark;
  final String? service;
  final bool boolValue;
  final String total;

  @override
  Widget build(BuildContext context) {
    final UserDetail userDetail = context.watch<ProfileCubit>().loadDetails();
    return Scaffold(
      body: GradientBg(
        child: Column(
          children: [
            const SarangAppbar(title: 'Payment'),
            CanvasCard(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('TOTAL',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    'Rs. $total',
                    style: const TextStyle(
                        fontSize: Sizes.s32, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Stack(
                          children: [
                            Visibility(
                              visible: boolValue == false ? true : false,
                              child: BlocListener<DocAppointmentCubit,
                                  DocAppointmentState>(
                                listener: (context, state) {
                                  state.whenOrNull(
                                    unsucceeded: (message) =>
                                        context.showCustomSnackBar(
                                      result: false,
                                      message: message,
                                    ),
                                    succeeded: (message) =>
                                        context.showCustomSnackBar(
                                      result: true,
                                      message: message,
                                    ),
                                  );
                                },
                                child: BlocBuilder<DocAppointmentCubit,
                                    DocAppointmentState>(
                                  builder: (context, state) {
                                    return SarangButton(
                                        onPressed: () {
                                          context
                                              .read<DocAppointmentCubit>()
                                              .docAppointment(
                                                  userId:
                                                      userDetail.pk.toString(),
                                                  username: userDetail.username,
                                                  doctorName: doctorName!,
                                                  doctorId: doctorId!,
                                                  appointmentDate:
                                                      appointmentDate,
                                                  appointmentTime:
                                                      appointmentTime,
                                                  contact: contact,
                                                  patientName: patientName,
                                                  age: age,
                                                  gender: gender,
                                                  userPatientRelation:
                                                      userPatientRelation,
                                                  doctorCategory:
                                                      doctorCategory!,
                                                  doctorImage: doctorImage!,
                                                  patientDescription:
                                                      patientDescription!);
                                        },
                                        isLoading: state.maybeWhen(
                                          orElse: () => false,
                                          loading: () => true,
                                        ),
                                        label: 'Book Appointment');
                                  },
                                ),
                              ),
                            ),
                            Visibility(
                              visible: boolValue == true ? true : false,
                              child: BlocListener<LabTestingCubit,
                                  LabTestingState>(
                                listener: (context, state) {
                                  state.whenOrNull(
                                    unsucceeded: (message) =>
                                        context.showCustomSnackBar(
                                      result: false,
                                      message: message,
                                    ),
                                    succeeded: (message) =>
                                        context.showCustomSnackBar(
                                      result: true,
                                      message: message,
                                    ),
                                  );
                                },
                                child: BlocBuilder<LabTestingCubit,
                                    LabTestingState>(
                                  builder: (context, state) {
                                    return SarangButton(
                                        onPressed: () {
                                          context
                                              .read<LabTestingCubit>()
                                              .labTesting(
                                                  userId:
                                                      userDetail.pk.toString(),
                                                  username: userDetail.username,
                                                  testList: testName!,
                                                  collectionDate:
                                                      appointmentDate,
                                                  collectionTime:
                                                      appointmentTime,
                                                  contact: contact,
                                                  patientName: patientName,
                                                  age: age,
                                                  gender: gender,
                                                  userPatientRelation:
                                                      userPatientRelation,
                                                  service: service!,
                                                  city: city!,
                                                  address: address!,
                                                  landmark: landmark!);
                                        },
                                        isLoading: state.maybeWhen(
                                          orElse: () => false,
                                          loading: () => true,
                                        ),
                                        label: 'Book Appointment');
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
