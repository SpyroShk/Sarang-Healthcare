import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:sarang_healthcare/core/presentation/theme/gradient_bg.dart';
import 'package:sarang_healthcare/core/presentation/theme/sizes.dart';
import 'package:sarang_healthcare/core/presentation/widgets/canvas_card.dart';
import 'package:sarang_healthcare/core/presentation/widgets/sarang_appbar.dart';
import 'package:sarang_healthcare/core/shared/context/show_toast.dart';
import 'package:sarang_healthcare/features/notifications/infrastructure/notifications_service.dart';
import 'package:sarang_healthcare/features/profile/application/cubit/profile_cubit.dart';
import 'package:sarang_healthcare/features/profile/domain/user_detail.dart';

import '../../../core/presentation/theme/app_color.dart';
import '../../../core/presentation/widgets/sarang_button.dart';
import '../../doc_appointment/application/cubit/doc_appointment_cubit.dart';
import '../../lab_testing/application/cubit/lab_testing_cubit.dart';

class Payment extends StatefulWidget {
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
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  getAmt() {
    return (double.parse(widget.total)).toInt() * 100;
  }

  NotificationsService notificationsService = NotificationsService();

  @override
  void initState() {
    super.initState();
    notificationsService.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    // print(total);
    final UserDetail userDetail = context.watch<ProfileCubit>().loadDetails();
    return Scaffold(
      body: GradientBg(
        child: Column(
          children: [
            SarangAppbar(
              title: 'Payment',
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColor.canvas,
                ),
                onPressed: () {
                  HapticFeedback.mediumImpact();
                  context.pop();
                },
              ),
            ),
            CanvasCard(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('TOTAL',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    'Rs. ${widget.total}',
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
                              visible: widget.boolValue == false ? true : false,
                              child: BlocListener<DocAppointmentCubit,
                                  DocAppointmentState>(
                                listener: (context, state) {
                                  state.whenOrNull(
                                    unsucceeded: (message) =>
                                        context.showCustomSnackBar(
                                      result: false,
                                      message: message,
                                    ),
                                    // succeeded: (message) =>
                                    //     context.showCustomSnackBar(
                                    //   result: true,
                                    //   message: message,
                                    // ),
                                  );
                                },
                                child: BlocBuilder<DocAppointmentCubit,
                                    DocAppointmentState>(
                                  builder: (context, state) {
                                    return SarangButton(
                                        onPressed: () {
                                          HapticFeedback.mediumImpact();
                                          KhaltiScope.of(context).pay(
                                              config: PaymentConfig(
                                                amount: getAmt(),
                                                productIdentity:
                                                    widget.doctorId.toString(),
                                                productName: widget.doctorName
                                                    .toString(),
                                              ),
                                              onSuccess: (success) {
                                                context.showCustomSnackBar(
                                                    message:
                                                        'Payment Successful.',
                                                    result: true);
                                                context
                                                    .read<DocAppointmentCubit>()
                                                    .docAppointment(
                                                        userId: userDetail.pk
                                                            .toString(),
                                                        username:
                                                            userDetail.username,
                                                        doctorName:
                                                            widget.doctorName!,
                                                        doctorId:
                                                            widget.doctorId!,
                                                        appointmentDate: widget
                                                            .appointmentDate,
                                                        appointmentTime: widget
                                                            .appointmentTime,
                                                        contact: widget.contact,
                                                        patientName:
                                                            widget.patientName,
                                                        age: widget.age,
                                                        gender: widget.gender,
                                                        userPatientRelation: widget
                                                            .userPatientRelation,
                                                        doctorCategory: widget
                                                            .doctorCategory!,
                                                        doctorImage:
                                                            widget.doctorImage!,
                                                        patientDescription: widget
                                                            .patientDescription!);
                                                context.pop();
                                                context.pop();
                                                notificationsService
                                                    .sendNotification(
                                                  widget.appointmentDate,
                                                  widget.appointmentTime,
                                                );
                                              },
                                              onFailure: (failure) {
                                                context.showCustomSnackBar(
                                                    message: 'Payment Failed.',
                                                    result: false);
                                              });
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
                              visible: widget.boolValue == true ? true : false,
                              child: BlocListener<LabTestingCubit,
                                  LabTestingState>(
                                listener: (context, state) {
                                  state.whenOrNull(
                                    unsucceeded: (message) =>
                                        context.showCustomSnackBar(
                                      result: false,
                                      message: message,
                                    ),
                                    // succeeded: (message) =>
                                    //     context.showCustomSnackBar(
                                    //   result: true,
                                    //   message: message,
                                    // ),
                                  );
                                },
                                child: BlocBuilder<LabTestingCubit,
                                    LabTestingState>(
                                  builder: (context, state) {
                                    return SarangButton(
                                        onPressed: () {
                                          HapticFeedback.mediumImpact();
                                          KhaltiScope.of(context).pay(
                                              config: PaymentConfig(
                                                amount: getAmt(),
                                                productIdentity:
                                                    userDetail.pk.toString(),
                                                productName: 'tests',
                                              ),
                                              onSuccess: (success) {
                                                context.showCustomSnackBar(
                                                    message:
                                                        'Payment Successful.',
                                                    result: true);
                                                context
                                                    .read<LabTestingCubit>()
                                                    .labTesting(
                                                      userId: userDetail.pk
                                                          .toString(),
                                                      username:
                                                          userDetail.username,
                                                      testList:
                                                          widget.testName!,
                                                      collectionDate: widget
                                                          .appointmentDate,
                                                      collectionTime: widget
                                                          .appointmentTime,
                                                      contact: widget.contact,
                                                      patientName:
                                                          widget.patientName,
                                                      age: widget.age,
                                                      gender: widget.gender,
                                                      userPatientRelation: widget
                                                          .userPatientRelation,
                                                      service: widget.service!,
                                                      city: widget.city!,
                                                      address: widget.address!,
                                                      landmark:
                                                          widget.landmark!,
                                                    );
                                                context.pop();
                                                context.pop();
                                                context.pop();
                                                context.pop();
                                                notificationsService
                                                    .sendNotification(
                                                  widget.appointmentDate,
                                                  widget.appointmentTime,
                                                );
                                              },
                                              onFailure: (failure) {
                                                context.showCustomSnackBar(
                                                  message: 'Payment Failed.',
                                                  result: false,
                                                );
                                              });
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
