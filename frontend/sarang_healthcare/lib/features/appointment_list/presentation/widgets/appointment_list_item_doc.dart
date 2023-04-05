import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/presentation/theme/app_color.dart';
import '../../../../core/presentation/theme/sizes.dart';
import '../../../../core/presentation/widgets/sarang_button.dart';
import '../../domain/appointment_list_model.dart';

class AppointmentListItemDoc extends StatefulWidget {
  const AppointmentListItemDoc({super.key, required this.appointmentList});
  final AppointmentListModel appointmentList;

  @override
  State<AppointmentListItemDoc> createState() => _AppointmentListItemDocState();
}

class _AppointmentListItemDocState extends State<AppointmentListItemDoc> {
  @override
  Widget build(BuildContext context) {
    String dateStr = widget.appointmentList.appointmentDate;
    String timeStr = widget.appointmentList.appointmentTime;
    final appointmentfilter =
        DateTime.parse('$dateStr $timeStr').isBefore(DateTime.now());
    return InkWell(
      onTap: () {
        HapticFeedback.mediumImpact();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    color: AppColor.canvas.withOpacity(0),
                  ),
                ),
                AlertDialog(
                  title: Column(
                    children: [
                      Text(
                        "Patient. ${widget.appointmentList.patientName}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: Sizes.s20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            'Age: ${widget.appointmentList.age}',
                            style: GoogleFonts.inter(
                              fontSize: Sizes.s16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            'Gender: ${widget.appointmentList.gender}',
                            style: GoogleFonts.inter(
                              fontSize: Sizes.s16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  content: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Text(
                          "Patient Description: ${widget.appointmentList.patientDescription}")),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  actions: [
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
            );
          },
        );
      },
      child: Container(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.60,
                          child: Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            "Patient. ${widget.appointmentList.patientName}",
                            style: GoogleFonts.inter(
                              fontSize: Sizes.s20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.secondary,
                            ),
                          ),
                        ),
                        Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          "User-Patient Relation: ${widget.appointmentList.userPatientRelation}",
                          style: GoogleFonts.inter(
                            fontSize: Sizes.s14,
                            color: AppColor.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
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
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              'Age: ${widget.appointmentList.age}',
                              style: GoogleFonts.inter(
                                fontSize: Sizes.s16,
                                fontWeight: FontWeight.bold,
                                color: AppColor.secondary,
                              ),
                            ),
                            Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              'Gender: ${widget.appointmentList.gender}',
                              style: GoogleFonts.inter(
                                fontSize: Sizes.s16,
                                fontWeight: FontWeight.bold,
                                color: AppColor.secondary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: Text(
                            textAlign: TextAlign.right,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            'User: ${widget.appointmentList.username}',
                            style: GoogleFonts.inter(
                              fontSize: Sizes.s16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.secondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
