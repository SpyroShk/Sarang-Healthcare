import 'dart:ui';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sarang_healthcare/core/shared/context/show_toast.dart';

import '../../../../core/presentation/theme/app_color.dart';
import '../../../../core/presentation/theme/sizes.dart';
import '../../../../core/presentation/widgets/sarang_button.dart';
import '../../../../core/shared/api_constants.dart';
import '../../../doc_appointment/application/cubit/doc_appointment_cubit.dart';
import '../../application/cubit/appointment_list_cubit.dart';
import '../../domain/appointment_list_model.dart';

class AppointmentListItem extends StatefulWidget {
  const AppointmentListItem({super.key, required this.appointmentList});
  final AppointmentListModel appointmentList;

  @override
  State<AppointmentListItem> createState() => _AppointmentListItemState();
}

class _AppointmentListItemState extends State<AppointmentListItem> {
  @override
  Widget build(BuildContext context) {
    String dateStr = widget.appointmentList.appointmentDate;
    String timeStr = widget.appointmentList.appointmentTime;
    final appointmentfilter =
        DateTime.parse('$dateStr $timeStr').isBefore(DateTime.now());
    return Container(
      foregroundDecoration: (appointmentfilter)
          ? BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(30),
              backgroundBlendMode: BlendMode.saturation,
            )
          : null,
      height: 180,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColor.appointmentCard,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircularProfileAvatar(
                        '${ApiConstants.baseUrl}/media/${widget.appointmentList.doctorImage}',
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        placeHolder: (context, url) => const SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(),
                        ),
                        radius: 25,
                        backgroundColor: Colors.transparent,
                        cacheImage: true,
                        showInitialTextAbovePicture: false,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              "Dr. ${widget.appointmentList.doctorName}",
                              style: GoogleFonts.inter(
                                fontSize: Sizes.s20,
                                fontWeight: FontWeight.bold,
                                color: AppColor.secondary,
                              ),
                            ),
                            Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              widget.appointmentList.doctorCategory,
                              style: GoogleFonts.inter(
                                fontSize: Sizes.s14,
                                color: AppColor.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {
                          if (!appointmentfilter) {
                            HapticFeedback.mediumImpact();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Stack(
                                  children: [
                                    BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5.0, sigmaY: 5.0),
                                      child: Container(
                                        color: AppColor.canvas.withOpacity(0),
                                      ),
                                    ),
                                    AlertDialog(
                                      title: const Text(
                                        "Cancel Appointment",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: Sizes.s20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      content: const Text(
                                          "Are you sure you want to cancel this appointment?\nYou will not be refunded for the appointment!"),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      actions: [
                                        Column(
                                          children: [
                                            BlocListener<DocAppointmentCubit,
                                                DocAppointmentState>(
                                              listener: (context, state) {
                                                state.whenOrNull(
                                                  unsucceeded: (message) =>
                                                      context
                                                          .showCustomSnackBar(
                                                    result: false,
                                                    message: message,
                                                  ),
                                                  succeeded: (message) =>
                                                      context
                                                          .showCustomSnackBar(
                                                    result: true,
                                                    message: message,
                                                  ),
                                                );
                                              },
                                              child: BlocBuilder<
                                                  DocAppointmentCubit,
                                                  DocAppointmentState>(
                                                builder: (context, state) {
                                                  return SarangButton(
                                                    onPressed: () {
                                                      HapticFeedback
                                                          .mediumImpact();
                                                      context
                                                          .read<
                                                              DocAppointmentCubit>()
                                                          .docAppointmentDelete(
                                                            id: widget
                                                                .appointmentList
                                                                .id,
                                                            userId: widget
                                                                .appointmentList
                                                                .userId,
                                                            username: widget
                                                                .appointmentList
                                                                .username,
                                                            doctorName: widget
                                                                .appointmentList
                                                                .doctorName,
                                                            doctorId: widget
                                                                .appointmentList
                                                                .doctorId,
                                                            doctorImage: widget
                                                                .appointmentList
                                                                .doctorImage,
                                                            doctorCategory: widget
                                                                .appointmentList
                                                                .doctorCategory,
                                                            appointmentDate: widget
                                                                .appointmentList
                                                                .appointmentDate,
                                                            appointmentTime: widget
                                                                .appointmentList
                                                                .appointmentTime,
                                                            contact: widget
                                                                .appointmentList
                                                                .contact,
                                                            patientName: widget
                                                                .appointmentList
                                                                .patientName,
                                                            age: widget
                                                                .appointmentList
                                                                .age,
                                                            gender: widget
                                                                .appointmentList
                                                                .gender,
                                                            userPatientRelation: widget
                                                                .appointmentList
                                                                .userPatientRelation,
                                                            patientDescription: widget
                                                                .appointmentList
                                                                .patientDescription,
                                                          );
                                                      Navigator.of(context)
                                                          .pop();
                                                      context
                                                          .read<
                                                              AppointmentListCubit>()
                                                          .getAppointmentListDetail();
                                                    },
                                                    isLoading: false,
                                                    label: 'Cancel Appointment',
                                                  );
                                                },
                                              ),
                                            ),
                                            SarangButton(
                                              onPressed: () {
                                                HapticFeedback.mediumImpact();
                                                Navigator.of(context).pop();
                                              },
                                              isLoading: false,
                                              label: 'Close',
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        icon: const Icon(
                          Icons.cancel,
                          size: 20,
                          color: AppColor.error,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColor.primary.withOpacity(0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.zero,
                              child: const Icon(
                                Icons.calendar_month_outlined,
                                size: 20,
                                color: AppColor.primary,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              overflow: TextOverflow.ellipsis,
                              widget.appointmentList.appointmentDate,
                              style: GoogleFonts.inter(
                                fontSize: Sizes.s14,
                                fontWeight: FontWeight.bold,
                                color: AppColor.secondary,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.zero,
                              child: const Icon(
                                Icons.access_time_outlined,
                                size: 20,
                                color: AppColor.primary,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              widget.appointmentList.appointmentTime,
                              style: GoogleFonts.inter(
                                fontSize: Sizes.s14,
                                fontWeight: FontWeight.bold,
                                color: AppColor.secondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        'Patient ${widget.appointmentList.patientName}',
                        style: GoogleFonts.inter(
                          fontSize: Sizes.s16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.secondary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
