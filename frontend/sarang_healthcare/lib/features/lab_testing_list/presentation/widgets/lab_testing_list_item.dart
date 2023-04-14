import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sarang_healthcare/core/shared/context/show_toast.dart';
import 'package:sarang_healthcare/features/lab_testing_list/application/cubit/lab_testing_list_cubit.dart';
import 'package:sarang_healthcare/features/lab_tests/infrastructure/dtos/lab_tests_dto.dart';

import '../../../../core/presentation/theme/app_color.dart';
import '../../../../core/presentation/theme/sizes.dart';
import '../../../../core/presentation/widgets/sarang_button.dart';
import '../../../appointment_list/application/cubit/appointment_list_cubit.dart';
import '../../../lab_testing/application/cubit/lab_testing_cubit.dart';
import '../../domain/lab_testing_list_model.dart';

class LabTestingListItem extends StatelessWidget {
  const LabTestingListItem({super.key, required this.labTestingList});
  final LabTestingListModel labTestingList;

  @override
  Widget build(BuildContext context) {
    String dateStr = labTestingList.collectionDate;
    String timeStr = labTestingList.collectionTime;

    List<LabTestsDto> parseLabTests(String input) {
      // Remove the brackets from the input string
      input = input
          .replaceAll('[', '')
          .replaceAll(']', '')
          .replaceAll(', L', ', LL');

      // Split the input string into individual LabTestsModel strings
      List<String> labTestsModelStrings = input.split(', L');

      // Create an empty list to store LabTestsDto objects
      List<LabTestsDto> labTests = [];

      // Parse each LabTestsModel string into a LabTestsDto object
      for (var modelString in labTestsModelStrings) {
        // Extract the fields from the LabTestsModel string using regular expressions
        final idMatch = RegExp(r'id:\s*(\d+)').firstMatch(modelString);
        final id = idMatch != null ? int.parse(idMatch.group(1)!) : 0;
        final testName = RegExp(r'testName:\s*([^,]+)')
                .firstMatch(modelString)
                ?.group(1)
                ?.trim() ??
            "";
        final priceMatch = RegExp(r'price:\s*([\d.]+)')
                .firstMatch(modelString)
                ?.group(1)
                ?.trim() ??
            "";
        final price = priceMatch;

        // Create a LabTestsDto object and add it to the list
        labTests.add(LabTestsDto(
            id: id, testName: testName, price: price, testDescription: ''));
      }

      return labTests;
    }

    log(parseLabTests(labTestingList.testList).toString());

    final collectionfilter =
        DateTime.parse('$dateStr $timeStr').isBefore(DateTime.now());
    return Container(
      foregroundDecoration: (collectionfilter)
          ? BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(30),
              backgroundBlendMode: BlendMode.saturation,
            )
          : null,
      height: 240,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColor.appointmentCard,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    'Patient. ${labTestingList.patientName}',
                    style: GoogleFonts.inter(
                      fontSize: Sizes.s16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.secondary,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                IconButton(
                  onPressed: () {
                    if (!collectionfilter) {
                      HapticFeedback.mediumImpact();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Stack(
                            children: [
                              BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
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
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                actions: [
                                  Column(
                                    children: [
                                      BlocListener<LabTestingCubit,
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
                                                HapticFeedback.mediumImpact();
                                                context
                                                    .read<LabTestingCubit>()
                                                    .labTestingDelete(
                                                      id: labTestingList.id,
                                                      userId: labTestingList
                                                          .userId
                                                          .toString(),
                                                      username: labTestingList
                                                          .username,
                                                      testList: labTestingList
                                                          .testList,
                                                      collectionDate:
                                                          labTestingList
                                                              .collectionDate,
                                                      collectionTime:
                                                          labTestingList
                                                              .collectionTime,
                                                      contact: labTestingList
                                                          .contact,
                                                      patientName:
                                                          labTestingList
                                                              .patientName,
                                                      age: labTestingList.age,
                                                      gender:
                                                          labTestingList.gender,
                                                      userPatientRelation:
                                                          labTestingList
                                                              .userPatientRelation,
                                                      service: labTestingList
                                                          .service,
                                                      city: labTestingList.city,
                                                      address: labTestingList
                                                          .address,
                                                      landmark: labTestingList
                                                          .landmark,
                                                    );
                                                Navigator.of(context).pop();
                                                context
                                                    .read<LabTestingListCubit>()
                                                    .getLabTestingListDetail();
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
                ),
              ],
            ),
            Container(
              height: 102,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                border: Border.all(
                  color: AppColor.primary.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                child: ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  physics: const BouncingScrollPhysics(),
                  itemCount: //labTestsList.length,
                      parseLabTests(labTestingList.testList).length, //
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            // labTestsList[index].testName,
                            "-${parseLabTests(labTestingList.testList)[index].testName}",
                            style: GoogleFonts.inter(
                              fontSize: Sizes.s18,
                              fontWeight: FontWeight.bold,
                              color: AppColor.secondary,
                            ),
                          ),
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          "Rs. ${parseLabTests(labTestingList.testList)[index].price.toString()}",
                          style: GoogleFonts.inter(
                            fontSize: Sizes.s14,
                            color: AppColor.grey,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            // const SizedBox(
            //   height: 15,
            // ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
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
                        labTestingList.collectionDate,
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
                        labTestingList.collectionTime,
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
          ],
        ),
      ),
    );
  }
}

// labTestingList.testList.toList()?.map((test) => test.testName).toString() ?? 'Tests';
